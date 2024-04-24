import 'dart:async';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/GetFavourites/get_favourites_model.dart';
import 'package:mediezy_user/Repository/Bloc/Favourites/GetFavourites/get_favourites_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_loadin_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/doctor_card_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/SearchScreen/search_screen.dart';

class SavedDoctorsScreen extends StatefulWidget {
  const SavedDoctorsScreen({super.key});

  @override
  State<SavedDoctorsScreen> createState() => _SavedDoctorsScreenState();
}

class _SavedDoctorsScreenState extends State<SavedDoctorsScreen> {
  late GetFavouritesModel getFavouritesModel;
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
    BlocProvider.of<GetFavouritesBloc>(context).add(FetchAllFavourites());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              child: BlocBuilder<GetFavouritesBloc, GetFavouritesState>(
                builder: (context, state) {
                  if (state is GetAllFavouritesLoading) {
                    return doctorCardLoadingWidget();
                  }
                  if (state is GetAllFavouritesError) {
                    return Center(
                      child: Image(
                        image: const AssetImage(
                            "assets/images/something went wrong-01.png"),
                        height: 200.h,
                        width: 200.w,
                      ),
                    );
                  }
                  if (state is GetAllFavouritesLoaded) {
                    getFavouritesModel =
                        BlocProvider.of<GetFavouritesBloc>(context)
                            .getFavouritesModel;
                    return FadedSlideAnimation(
                      beginOffset: const Offset(0, 0.3),
                      endOffset: const Offset(0, 0),
                      slideCurve: Curves.linearToEaseOut,
                      child: getFavouritesModel.favoriteDoctors!.isEmpty
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
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 8.w),
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
                                            padding:
                                                EdgeInsets.only(left: 10.w),
                                            child: Text(
                                              "Search your Doctor",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: kSubTextColor),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 10.w),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  const Color(0xFF56B89C),
                                              radius: 16,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
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
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return DoctorCardWidget(
                                          userAwayFrom: getFavouritesModel
                                              .favoriteDoctors![index]
                                              .distanceFromUser
                                              .toString(),
                                          clinicList: getFavouritesModel
                                              .favoriteDoctors![index].clinics!
                                              .toList(),
                                          doctorId: getFavouritesModel
                                              .favoriteDoctors![index].userId
                                              .toString(),
                                          firstName: getFavouritesModel
                                              .favoriteDoctors![index].firstname
                                              .toString(),
                                          lastName: getFavouritesModel
                                              .favoriteDoctors![index]
                                              .secondname
                                              .toString(),
                                          imageUrl: getFavouritesModel
                                              .favoriteDoctors![index]
                                              .docterImage
                                              .toString(),
                                          mainHospitalName: getFavouritesModel
                                              .favoriteDoctors![index]
                                              .mainHospital
                                              .toString(),
                                          specialisation: getFavouritesModel
                                              .favoriteDoctors![index]
                                              .specialization
                                              .toString(),
                                          location: getFavouritesModel
                                              .favoriteDoctors![index].location
                                              .toString(),
                                        );
                                      },
                                      itemCount: getFavouritesModel
                                          .favoriteDoctors!.length)
                                ],
                              ),
                            ),
                    );
                  }
                  return Container();
                },
              ),
            );
          }
        },
      ),
    );
  }
}
