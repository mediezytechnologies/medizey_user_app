import 'dart:async';
import 'dart:io';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/CommonWidgets/recommend_doctor_card.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/doctor_card_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/ddd/application/get_docters/get_docters_bloc.dart';
import '../../../../Repository/Bloc/Favourites/AddFavourites/add_favourites_bloc.dart';
import '../../../../ddd/application/get_fav_doctor/get_fav_doctor_bloc.dart';
import '../../../../ddd/application/get_recently_booked_doctor/get_recently_booked_doctor_bloc.dart';

class AllDoctorNearYouScreen extends StatefulWidget {
  const AllDoctorNearYouScreen({super.key});

  @override
  State<AllDoctorNearYouScreen> createState() => _AllDoctorNearYouScreenState();
}

class _AllDoctorNearYouScreenState extends State<AllDoctorNearYouScreen> {
  late StreamSubscription<ConnectivityResult> subscription;
  bool isClicked = false;

  void handleConnectivityChange(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
    } else {}
  }

  @override
  void initState() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      handleConnectivityChange(result);
    });
    BlocProvider.of<GetDoctersBloc>(context)
        .add(const GetDoctersEvent.started(true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctors Near You"),
        centerTitle: true,
      ),
      body: StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            final connectivityResult = snapshot.data;
            if (connectivityResult == ConnectivityResult.none) {
              return const InternetHandleScreen();
            } else {
              return BlocConsumer<GetDoctersBloc, GetDoctersState>(
                listener: (context, state) {
                  if (state.isError) {
                    Center(
                      child: Image(
                        image: const AssetImage(
                            "assets/images/something went wrong-01.png"),
                        height: 200.h,
                        width: 200.w,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state.isloding) {
                    return Center(
                      child: Platform.isIOS
                          ? CupertinoActivityIndicator(color: kMainColor)
                          : CircularProgressIndicator(color: kMainColor),
                    );
                  }
                  return FadedSlideAnimation(
                    beginOffset: const Offset(0, 0.3),
                    endOffset: const Offset(0, 0),
                    slideCurve: Curves.linearToEaseOut,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final doctor = state.model[index];
                                return DoctorCardWidget(
                                  favourites: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        BlocProvider.of<GetFavDoctorBloc>(
                                                context)
                                            .add(
                                                const GetFavDoctorEvent.started(
                                                    false));
                                        BlocProvider.of<GetDoctersBloc>(context)
                                            .add(GetDoctersEvent.changeFav(
                                                state.model[index].id!));
                                        BlocProvider.of<AddFavouritesBloc>(
                                                context)
                                            .add(
                                          AddFavourites(
                                            doctorId: state.model[index].userId
                                                .toString(),
                                            favouriteStatus: state.favId,
                                          ),
                                        );
                                      });
                                      BlocProvider.of<GetDoctersBloc>(context)
                                          .add(const GetDoctersEvent.started(
                                              false));
                                      BlocProvider.of<
                                                  GetRecentlyBookedDoctorBloc>(
                                              context)
                                          .add(
                                              const GetRecentlyBookedDoctorEvent
                                                  .started(false));
                                    },
                                    child: SizedBox(
                                      height: size.height * 0.028,
                                      width: size.width * 0.07,
                                      child: Image.asset(
                                        state.model[index].favoriteStatus == 1
                                            ? "assets/icons/favorite1.png"
                                            : "assets/icons/favorite2.png",
                                      ),
                                    ),
                                  ),
                                  clinicList: 
                                  doctor.clinics!.toList(),
                                  doctorId: doctor.userId.toString(),
                                  firstName: doctor.firstname.toString(),
                                  lastName: doctor.secondname.toString(),
                                  imageUrl: doctor.docterImage.toString(),
                                  mainHospitalName:
                                      doctor.mainHospital.toString(),
                                  specialisation:
                                      doctor.specialization.toString(),
                                  location: doctor.location.toString(),
                                );
                              },
                              itemCount: state.model.length),
                          const VerticalSpacingWidget(height: 5),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: const RecommendedDoctorCard(),
                          ),
                          const VerticalSpacingWidget(height: 5)
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
