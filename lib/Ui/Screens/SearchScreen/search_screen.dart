// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/Search/search_doctor_model.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/CommonWidgets/recommend_doctor_card.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/CommonWidgets/doctor_card_widget.dart';
import '../../../Repository/Bloc/Favourites/AddFavourites/add_favourites_bloc.dart';
import '../../../ddd/application/get_docters/get_docters_bloc.dart';
import '../../../ddd/application/get_fav_doctor/get_fav_doctor_bloc.dart';
import '../../../ddd/application/search_doctor/search_doctor_bloc.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen(
      {super.key,
      this.patientId,
      this.resheduleType,
      this.normalResheduleTokenId});

  String? patientId;
  String? resheduleType;
  String? normalResheduleTokenId;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchDoctorModel searchDoctorModel;
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
    BlocProvider.of<SearchDoctorBloc>(context)
        .add(const SearchDoctorEvent.started(''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        centerTitle: true,
      ),
      body: StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            final connectivityResult = snapshot.data;
            if (connectivityResult == ConnectivityResult.none) {
              return const InternetHandleScreen();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: SizedBox(
                        child: TextFormField(
                          autofocus: true,
                          cursorColor: kMainColor,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          onChanged: (newValue) {
                            BlocProvider.of<SearchDoctorBloc>(context)
                                .add(SearchDoctorEvent.started(newValue));
                          },
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              IconlyLight.search,
                              color: kMainColor,
                            ),
                            hintStyle: TextStyle(
                                fontSize: 16.sp, color: kSubTextColor),
                            hintText: "Search doctors",
                            filled: true,
                            fillColor: kCardColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpacingWidget(height: 10),
                    BlocConsumer<SearchDoctorBloc, SearchDoctorState>(
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
                    }, builder: (context, state) {
                      if (state.isloding) {
                        return SizedBox(
                          height: 300.h,
                          child: Center(
                            child: Platform.isIOS
                                ? CupertinoActivityIndicator(color: kMainColor)
                                : CircularProgressIndicator(
                                    color: kMainColor,
                                  ),
                          ),
                        );
                      }
                      return state.model.isEmpty
                          ? Center(
                              child: Column(
                                children: [
                                  const VerticalSpacingWidget(height: 20),
                                  Image(
                                    image: const AssetImage(
                                        "assets/icons/no doctor.png"),
                                    height: 250.h,
                                    width: 300.w,
                                  ),
                                  Text(
                                    "No doctor found",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  const VerticalSpacingWidget(height: 20),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: RecommendedDoctorCard(),
                                  ),
                                  const VerticalSpacingWidget(height: 20),
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: state.model.length,
                                    itemBuilder: (context, index) {
                                      final doctor = state.model[index];
                                      return DoctorCardWidget(
                                        favourites: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              BlocProvider.of<GetFavDoctorBloc>(
                                                      context)
                                                  .add(const GetFavDoctorEvent
                                                      .started());
                                              BlocProvider.of<SearchDoctorBloc>(
                                                      context)
                                                  .add(SearchDoctorEvent
                                                      .changeFav(state
                                                          .model[index].id!));
                                              BlocProvider.of<
                                                          AddFavouritesBloc>(
                                                      context)
                                                  .add(
                                                AddFavourites(
                                                  doctorId: state
                                                      .model[index].userId
                                                      .toString(),
                                                  favouriteStatus: state.favId,
                                                ),
                                              );
                                              BlocProvider.of<GetFavDoctorBloc>(
                                                      context)
                                                  .add(const GetFavDoctorEvent
                                                      .started());
                                              BlocProvider.of<GetDoctersBloc>(
                                                      context)
                                                  .add(const GetDoctersEvent
                                                      .started());
                                            });
                                          },
                                          child: SizedBox(
                                            height: size.height * 0.028,
                                            width: size.width * 0.07,
                                            child: Image.asset(
                                              state.model[index]
                                                          .favoriteStatus ==
                                                      1
                                                  ? "assets/icons/favorite1.png"
                                                  : "assets/icons/favorite2.png",
                                              color: kMainColor,
                                            ),
                                          ),
                                        ),
                                        patientId: widget.patientId,
                                        userAwayFrom:
                                            doctor.distanceFromUser.toString(),
                                        clinicList: doctor.clinics!.toList(),
                                        doctorId: doctor.userId.toString(),
                                        firstName: doctor.firstname.toString(),
                                        lastName: doctor.lastname.toString(),
                                        imageUrl: doctor.docterImage.toString(),
                                        mainHospitalName:
                                            doctor.mainHospital.toString(),
                                        specialisation:
                                            doctor.specialization.toString(),
                                        location: doctor.location.toString(),
                                      );
                                    }),
                                const VerticalSpacingWidget(height: 5),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: RecommendedDoctorCard(),
                                ),
                              ],
                            );
                    }),
                  ],
                ),
              );
            }
          }),
    );
  }
}
