import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/Search/search_doctor_model.dart';
import 'package:mediezy_user/Repository/Bloc/SearchDoctor/search_doctor_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/CommonWidgets/recommend_doctor_card.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/CommonWidgets/doctor_card_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

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
        .add(FetchSeachedDoctor(searchQuery: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                                .add(FetchSeachedDoctor(searchQuery: newValue));
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
                    BlocBuilder<SearchDoctorBloc, SearchDoctorState>(
                      builder: (context, state) {
                        if (state is SearchDoctorLoading) {
                          return SizedBox(
                            height: 300.h,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: kMainColor,
                              ),
                            ),
                          );
                        }
                        if (state is SearchDoctorError) {
                          return Center(
                            child: Image(
                              image: const AssetImage(
                                  "assets/images/something went wrong-01.png"),
                              height: 200.h,
                              width: 200.w,
                            ),
                          );
                        }
                        if (state is SearchDoctorLoaded) {
                          searchDoctorModel =
                              BlocProvider.of<SearchDoctorBloc>(context)
                                  .searchDoctorModel;
                          return searchDoctorModel.searchDoctors == null ||
                                  searchDoctorModel.searchDoctors!.isEmpty
                              ? const RecommendedDoctorCard()
                              : ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      searchDoctorModel.searchDoctors!.length,
                                  itemBuilder: (context, index) {
                                    return DoctorCardWidget(
                                      userAwayFrom: "2.2",
                                      clinicList: searchDoctorModel
                                          .searchDoctors![index].clinics!
                                          .toList(),
                                      doctorId: searchDoctorModel
                                          .searchDoctors![index].userId
                                          .toString(),
                                      firstName: searchDoctorModel
                                          .searchDoctors![index].firstname
                                          .toString(),
                                      lastName: searchDoctorModel
                                          .searchDoctors![index].secondname
                                          .toString(),
                                      imageUrl: searchDoctorModel
                                          .searchDoctors![index].docterImage
                                          .toString(),
                                      mainHospitalName: searchDoctorModel
                                          .searchDoctors![index].mainHospital
                                          .toString(),
                                      specialisation: searchDoctorModel
                                          .searchDoctors![index].specialization
                                          .toString(),
                                      location: searchDoctorModel
                                          .searchDoctors![index].location
                                          .toString(),
                                    );
                                  });
                        }
                        return Container();
                      },
                    ),
                    const Padding(
                      padding:  EdgeInsets.all(8.0),
                      child:  RecommendedDoctorCard(),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
