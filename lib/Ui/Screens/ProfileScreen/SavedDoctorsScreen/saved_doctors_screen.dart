import 'dart:async';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_loadin_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/SearchScreen/search_screen.dart';
import 'package:mediezy_user/ddd/application/get_fav_doctor/get_fav_doctor_bloc.dart';
import '../../../../Repository/Bloc/Favourites/AddFavourites/add_favourites_bloc.dart';
import '../../../../ddd/application/get_docters/get_docters_bloc.dart';
import '../../HomeScreen/Widgets/doctor_favourite_card_widget.dart';

class SavedDoctorsScreen extends StatefulWidget {
  const SavedDoctorsScreen({super.key});

  @override
  State<SavedDoctorsScreen> createState() => _SavedDoctorsScreenState();
}

class _SavedDoctorsScreenState extends State<SavedDoctorsScreen> {
 
  late StreamSubscription<ConnectivityResult> subscription;

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
    BlocProvider.of<GetFavDoctorBloc>(context)
        .add(const GetFavDoctorEvent.started());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite doctors"),
        centerTitle: true,
      ),
      body: StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          final connectivityResult = snapshot.data;
          if (connectivityResult == ConnectivityResult.none) {
            return const InternetHandleScreen();
          } else {
            return FadedSlideAnimation(
              beginOffset: const Offset(0, 0.3),
              endOffset: const Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
              child: BlocConsumer<GetFavDoctorBloc, GetFavDoctorState>(
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
                    return doctorCardLoadingWidget();
                  }
                  return state.model.isEmpty
                      ? Center(
                          child: Column(
                            children: [
                              const VerticalSpacingWidget(height: 100),
                              Image(
                                image: const AssetImage(
                                    "assets/icons/favourite.png"),
                                height: 250.h,
                                width: 300.w,
                              ),
                              Text(
                                "No favourite doctors\nare available",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              const VerticalSpacingWidget(height: 10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SearchScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                                  height: 45,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: kCardColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.w),
                                        child: Text(
                                          "Search your Doctor",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: kSubTextColor),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 10.w),
                                        child: CircleAvatar(
                                          backgroundColor:
                                              const Color(0xFF56B89C),
                                          radius: 16,
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Icon(
                                              IconlyLight.search,
                                              color: kCardColor,
                                              size: 16.sp,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const VerticalSpacingWidget(height: 10),
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: state.model.length,
                                itemBuilder: (context, index) {
                                  return DoctorFavouriteCardWidget(
                                    userAwayFrom: "2.2",
                                    clinicList:
                                        state.model[index].clinics!.toList(),
                                    doctorId:
                                        state.model[index].userId.toString(),
                                    firstName:
                                        state.model[index].firstname.toString(),
                                    lastName: state.model[index].secondname
                                        .toString(),
                                    imageUrl: state.model[index].docterImage
                                        .toString(),
                                    mainHospitalName: state
                                        .model[index].mainHospital
                                        .toString(),
                                    specialisation: state
                                        .model[index].specialization
                                        .toString(),
                                    location:
                                        state.model[index].location.toString(),
                                    favourites: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          BlocProvider.of<GetFavDoctorBloc>(
                                                  context)
                                              .add(const GetFavDoctorEvent
                                                  .started());
                                          BlocProvider.of<GetDoctersBloc>(
                                                  context)
                                              .add(const GetDoctersEvent
                                                  .started());
                                          BlocProvider.of<AddFavouritesBloc>(
                                                  context)
                                              .add(
                                            AddFavourites(
                                              doctorId: state
                                                  .model[index].userId
                                                  .toString(),
                                              favouriteStatus: state.favId,
                                            ),
                                          );
                                        });
                                      },
                                      child: SizedBox(
                                        height: size.height * 0.028,
                                        width: size.width * 0.07,
                                        child: Image.asset(
                                          state.model[index].favoriteStatus == 1
                                              ? "assets/icons/favorite1.png"
                                              : "assets/icons/favorite2.png",
                                          color: kMainColor,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
