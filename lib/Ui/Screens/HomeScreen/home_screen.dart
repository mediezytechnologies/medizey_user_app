// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/Article/get_all_article_model.dart';
import 'package:mediezy_user/Model/Banner/banner_model.dart';
import 'package:mediezy_user/Model/GetAppointments/get_upcoming_appointments_model.dart';
import 'package:mediezy_user/Model/GetRecentlyBookedDoctor/get_recently_booked_doctor_model.dart';
import 'package:mediezy_user/Model/GetSymptomAndDoctor/get_health_symptoms_model.dart';
import 'package:mediezy_user/Model/HealthCategories/get_health_categories_model.dart';
import 'package:mediezy_user/Model/Hospital/get_hospitals_model.dart';
import 'package:mediezy_user/Model/Profile/get_user_model.dart';
import 'package:mediezy_user/Repository/Bloc/Article/article_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetAppointment/GetCompletedAppointments/get_completed_appointments_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetAppointment/GetUpcomingAppointment/get_upcoming_appointment_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetHealthSymptomsAndDoctor/GetHealthSymptoms/get_health_symptoms_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetRecentlyBookedDoctor/get_recently_booked_doctors_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthCategories/GetHealthCategories/get_health_categories_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Hospital/GetHospital/get_hospital_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Profile/GetUser/get_user_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Suggestion/suggestion_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/banner/banner_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/heading_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/recommend_doctor_card.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/AppointmentsScreen/Widgets/appointment_card_widget.dart';
import 'package:mediezy_user/Ui/Screens/AppointmentsScreen/appointments_screen.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/Widgets/doctor_card_widget.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/AddPatientScreen/AddPatientScreen.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/ArticleScreen/article_screen.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/HospitalListingScreen/hospital_listing_screen.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/LocationScreen/location_screen.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/health_concern_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_screen_loading_widgets.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/hospital_card_widget.dart';
import 'package:mediezy_user/Ui/Screens/ProfileScreen/RecentBookedDoctorsScreen/recent_booked_doctors_screen.dart';
import 'package:mediezy_user/Ui/Screens/ProfileScreen/profile_screen.dart';
import 'package:mediezy_user/Ui/Screens/SearchScreen/search_screen.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController suggestionController = TextEditingController();
  late GetUpComingAppointmentsModel getUpComingAppointmentsModel;
  late GetHealthCategoriesModel getHealthCategoriesModel;
  late GetRecentlyBookedDoctorModel getRecentlyBookedDoctorModel;
  late GetUserModel getUserModel;
  late GetHealthSymptomsModel getHealthSymptomsModel;
  late GetHospitalModel getHospitalModel;
  late GetAllArticleModel getAllArticleModel;
  late BannerModel bannerModel;
  int currentDotIndex = 0;
  String? firstName;
  String? lastName;
  late Timer pollingTimer;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetUpcomingAppointmentBloc>(context)
        .add(FetchUpComingAppointments());
    BlocProvider.of<GetHealthCategoriesBloc>(context)
        .add(FetchHealthCategories());
    BlocProvider.of<GetUserBloc>(context).add(FetchUserDetails());
    BlocProvider.of<GetRecentlyBookedDoctorsBloc>(context)
        .add(FetchRecentlyBookedDoctors());
    BlocProvider.of<GetHealthSymptomsBloc>(context)
        .add(FetchAllHealthSymptoms());
    BlocProvider.of<GetHospitalBloc>(context).add((FetchAllHospitals()));
    BlocProvider.of<ArticleBloc>(context).add((FetchArticle()));
    BlocProvider.of<GetCompletedAppointmentsBloc>(context)
        .add(FetchCompletedAppointments());
    BlocProvider.of<BannerBloc>(context).add(FetchBannerEvent(type: "1"));
    startPolling();
  }

  void startPolling() async {
    pollingTimer = Timer.periodic(const Duration(seconds: 15), (timer) {
      BlocProvider.of<GetUpcomingAppointmentBloc>(context)
          .add(FetchUpComingAppointments());
    });
  }

  void stopPolling() {
    pollingTimer.cancel();
  }

  @override
  void dispose() {
    stopPolling();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadedSlideAnimation(
      beginOffset: const Offset(0, 0.3),
      endOffset: const Offset(0, 0),
      slideCurve: Curves.linearToEaseOut,
      child: WillPopScope(
        onWillPop: () async {
          GeneralServices.instance
              .appCloseDialogue(context, "Are you want to Exit", () async {
            SystemNavigator.pop();
          });
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 20.sp,
                  color: Colors.white,
                ),
                const HorizontalSpacingWidget(width: 5),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LocationScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Kochi",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            backgroundColor: const Color(0xFF4cb499),
            actions: [
              Image(
                image: const AssetImage(
                  "assets/icons/mediezy logo small.png",
                ),
                height: 40.h,
                width: 100.w,
              ),
              const HorizontalSpacingWidget(width: 10)
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    const Image(
                      image: AssetImage("assets/images/home_screen.jpg"),
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      left: 15.w,
                      right: 15.w,
                      child: BlocBuilder<GetUserBloc, GetUserState>(
                        builder: (context, state) {
                          if (state is GetUserDetailsError) {
                            return const Text("No Name");
                          }
                          if (state is GetUserDetailsLoaded) {
                            getUserModel = BlocProvider.of<GetUserBloc>(context)
                                .getUserModel;
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ProfileScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Hi, ${getUserModel.userdetails!.firstname}",
                                style: TextStyle(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                    Positioned(
                      top: 30.h,
                      left: 15.w,
                      child: Text(
                        "Your one stop solution for\nQuick and easy consultation",
                        style: TextStyle(
                            height: 1.2,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 70.h,
                      left: 15.w,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return  AddPatientScreen();
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          height: 40.h,
                          width: MediaQuery.of(context).size.width * .5,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kCardColor,
                              width: 1.0,
                            ),
                            color: const Color(0xFF429b79),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Add Family Member",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: kCardColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10.h,
                      left: 15.w,
                      right: 15.w,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SearchScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 300,
                          decoration: BoxDecoration(
                            color: kCardColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: Text(
                                  "Search your doctor",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: kSubTextColor),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xFF56B89C),
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
                    )
                  ],
                ),
                const VerticalSpacingWidget(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: const RecommendedDoctorCard(),
                ),
                const VerticalSpacingWidget(height: 5),
                //! your appointments
                BlocBuilder<GetUpcomingAppointmentBloc,
                    GetUpcomingAppointmentState>(
                  builder: (context, state) {
                    if (state is GetUpComingAppointmentLoading) {
                      return upComingAppointmentsLoadingWidget();
                    }
                    if (state is GetUpComingAppointmentError) {
                      return Container();
                    }
                    if (state is GetUpComingAppointmentLoaded) {
                      if (state.isLoaded) {
                        getUpComingAppointmentsModel =
                            BlocProvider.of<GetUpcomingAppointmentBloc>(context)
                                .getUpComingAppointmentsModel;
                        return getUpComingAppointmentsModel
                                        .upcomingAppointments ==
                                    null ||
                                getUpComingAppointmentsModel
                                    .upcomingAppointments!.isEmpty
                            ? Container()
                            : Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: HeadingWidget(
                                      title: "Your appointments",
                                      viewAllFunction: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const AppointmentsScreen(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const VerticalSpacingWidget(height: 5),
                                  ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: getUpComingAppointmentsModel
                                                  .upcomingAppointments!
                                                  .length >
                                              2
                                          ? 2
                                          : getUpComingAppointmentsModel
                                              .upcomingAppointments!.length,
                                      itemBuilder: (context, index) {
                                        return AppointmentCardWidget(
                                          isCheckIn:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .isCheckedin!,
                                          isReached:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .isReached!,
                                          doctorUniqueId:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .mediezyDoctorId
                                                  .toString(),
                                          patientId:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .patientId!,
                                          tokenId: getUpComingAppointmentsModel
                                              .upcomingAppointments![index]
                                              .tokenId!,
                                          isPatientAbsent:
                                              getUpComingAppointmentsModel
                                                          .upcomingAppointments![
                                                              index]
                                                          .patientAbsent ==
                                                      true
                                                  ? "Absent"
                                                  : "Not absent",
                                          nextAvailableDateAndTime:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .nextAvailableTokenDate
                                                  .toString(),
                                          nextAvailableTokenNumber:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .nextAvailableTokenNumber
                                                  .toString(),
                                          doctorId: getUpComingAppointmentsModel
                                              .upcomingAppointments![index]
                                              .doctorId
                                              .toString(),
                                          clinicList:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .clinics!
                                                  .toList(),
                                          resheduleStatus:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .rescheduleType!,
                                          bookingTimeAndDate:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .tokenBookedDate
                                                  .toString(),
                                          docterName:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .doctorName
                                                  .toString(),
                                          bookedClinicName:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .clinicName
                                                  .toString(),
                                          leaveMessage:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .leaveStatus!,
                                          docterImage:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .doctorImage
                                                  .toString(),
                                          appointmentFor:
                                              getUpComingAppointmentsModel
                                                          .upcomingAppointments![
                                                              index]
                                                          .mainSymptoms ==
                                                      null
                                                  ? getUpComingAppointmentsModel
                                                      .upcomingAppointments![
                                                          index]
                                                      .otherSymptom!
                                                      .symtoms
                                                      .toString()
                                                  : getUpComingAppointmentsModel
                                                      .upcomingAppointments![
                                                          index]
                                                      .mainSymptoms!
                                                      .mainsymptoms
                                                      .toString(),
                                          tokenNumber:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .tokenNumber
                                                  .toString(),
                                          appointmentDate:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .tokenScheduledDate
                                                  .toString(),
                                          appointmentTime:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .tokenStartTime
                                                  .toString(),
                                          patientName:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .patientName
                                                  .toString(),
                                          consultationStartingTime:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .scheduleStartTime
                                                  .toString(),
                                          earlyTime:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .doctorEarlyTime
                                                  .toString(),
                                          estimatedArrivalTime:
                                              getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .estimateArrivalTime
                                                  .toString(),
                                          lateTime: getUpComingAppointmentsModel
                                              .upcomingAppointments![index]
                                              .doctorLateTime
                                              .toString(),
                                          liveToken: getUpComingAppointmentsModel
                                                      .upcomingAppointments![
                                                          index]
                                                      .liveToken ==
                                                  0
                                              ? '0'
                                              : getUpComingAppointmentsModel
                                                  .upcomingAppointments![index]
                                                  .liveToken
                                                  .toString(),
                                        );
                                      }),
                                ],
                              );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: kMainColor,
                          ),
                        );
                      }
                    }
                    return Container();
                  },
                ),
                const VerticalSpacingWidget(height: 5),
                BlocBuilder<GetHealthCategoriesBloc, GetHealthCategoriesState>(
                  builder: (context, state) {
                    if (state is GetHealthCategoriesLoading) {
                      return healthConcernLoadingWidget();
                    }
                    if (state is GetHealthCategoriesError) {
                      return const Center(
                        child: Image(
                          image: AssetImage(
                              "assets/images/something went wrong-01.png"),
                        ),
                      );
                    }
                    if (state is GetHealthCategoriesLoaded) {
                      getHealthCategoriesModel =
                          BlocProvider.of<GetHealthCategoriesBloc>(context)
                              .getHealthCategoriesModel;
                      return getHealthCategoriesModel.categories!.isEmpty
                          ? Container()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //! health concern
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Text(
                                    "Browse by health concern",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: kSubTextColor),
                                  ),
                                ),
                                const VerticalSpacingWidget(height: 5),
                                GridView.builder(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    itemCount: getHealthCategoriesModel
                                        .categories!.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            crossAxisSpacing: 10,
                                            childAspectRatio: .75),
                                    itemBuilder: (context, index) {
                                      return HealthConcernWidget(
                                        title: getHealthCategoriesModel
                                            .categories![index].categoryName
                                            .toString(),
                                        imageUrl: getHealthCategoriesModel
                                            .categories![index].image
                                            .toString(),
                                        healthCategoryId:
                                            getHealthCategoriesModel
                                                .categories![index].id
                                                .toString(),
                                      );
                                    }),
                              ],
                            );
                    }
                    return Container();
                  },
                ),
                const VerticalSpacingWidget(height: 5),
                //! recently added doctors
                BlocBuilder<GetRecentlyBookedDoctorsBloc,
                    GetRecentlyBookedDoctorsState>(
                  builder: (context, state) {
                    if (state is GetRecentlyBookedDoctorLoading) {
                      return doctorCardMainLoadingWidget();
                    }
                    if (state is GetRecentlyBookedDoctorError) {
                      return Center(
                        child: Image(
                          image: const AssetImage(
                              "assets/images/something went wrong-01.png"),
                          height: 200.h,
                          width: 200.w,
                        ),
                      );
                    }
                    if (state is GetRecentlyBookedDoctorLoaded) {
                      getRecentlyBookedDoctorModel =
                          BlocProvider.of<GetRecentlyBookedDoctorsBloc>(context)
                              .getRecentlyBookedDoctorModel;
                      return getRecentlyBookedDoctorModel
                                  .recentlyBookedDoctor ==
                              null
                          ? Container()
                          : Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: HeadingWidget(
                                    title: "Recent booked doctors",
                                    viewAllFunction: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RecentBookedDoctorsScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const VerticalSpacingWidget(height: 5),
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: getRecentlyBookedDoctorModel
                                                .recentlyBookedDoctor!.length >
                                            2
                                        ? 2
                                        : getRecentlyBookedDoctorModel
                                            .recentlyBookedDoctor!.length,
                                    itemBuilder: (context, index) {
                                      return DoctorCardWidget(
                                        clinicList: getRecentlyBookedDoctorModel
                                            .recentlyBookedDoctor![index]
                                            .clinics!
                                            .toList(),
                                        doctorId: getRecentlyBookedDoctorModel
                                            .recentlyBookedDoctor![index].userId
                                            .toString(),
                                        firstName: getRecentlyBookedDoctorModel
                                            .recentlyBookedDoctor![index]
                                            .firstname
                                            .toString(),
                                        lastName: getRecentlyBookedDoctorModel
                                            .recentlyBookedDoctor![index]
                                            .secondname
                                            .toString(),
                                        imageUrl: getRecentlyBookedDoctorModel
                                            .recentlyBookedDoctor![index]
                                            .docterImage
                                            .toString(),
                                        mainHospitalName:
                                            getRecentlyBookedDoctorModel
                                                .recentlyBookedDoctor![index]
                                                .mainHospital
                                                .toString(),
                                        specialisation:
                                            getRecentlyBookedDoctorModel
                                                .recentlyBookedDoctor![index]
                                                .specialization
                                                .toString(),
                                        location: getRecentlyBookedDoctorModel
                                            .recentlyBookedDoctor![index]
                                            .location
                                            .toString(),
                                      );
                                    }),
                              ],
                            );
                    }
                    return Container();
                  },
                ),
                // const VerticalSpacingWidget(height: 10),
                // //! questionare
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 8.w),
                //   child: InkWell(
                //     onTap: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) =>
                //                   const QuestionnaireScreen()));
                //     },
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(10),
                //       child: const Image(
                //         image:
                //             AssetImage("assets/images/questinare_banner.jpg"),
                //         fit: BoxFit.contain,
                //       ),
                //     ),
                //   ),
                // ),
                const VerticalSpacingWidget(height: 10),
                //! suggestion box
                Stack(
                  children: [
                    const Image(
                      image: AssetImage("assets/images/suggestion.jpg"),
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      left: 10.w,
                      top: 75.h,
                      child: SizedBox(
                        width: 220.w,
                        height: 300.h,
                        child: TextFormField(
                          maxLines: 3,
                          cursorColor: kMainColor,
                          controller: suggestionController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontSize: 13.sp, color: kSubTextColor),
                            hintText: "Describe your experience",
                            filled: true,
                            fillColor: kCardColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10.w,
                      top: 185.h,
                      child: Row(
                        children: [
                          Text(
                            "We really appreciate\n your feedback",
                            style: TextStyle(
                                fontSize: 9.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const HorizontalSpacingWidget(width: 40),
                          InkWell(
                            onTap: () {
                              BlocProvider.of<SuggestionBloc>(context).add(
                                FetchSuggestions(
                                    message: suggestionController.text),
                              );
                              suggestionController.clear();
                            },
                            child: Container(
                              height: 30.h,
                              width: 90.w,
                              decoration: BoxDecoration(
                                color: kCardColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: kMainColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const VerticalSpacingWidget(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: HeadingWidget(
                    title: "Hospitals and clinics near you",
                    viewAllFunction: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HospitalListingScreen(),
                        ),
                      );
                    },
                  ),
                ),
                BlocBuilder<GetHospitalBloc, GetHospitalState>(
                  builder: (context, state) {
                    if (state is GetHospitalLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: kMainColor,
                        ),
                      );
                    }
                    if (state is GetHospitalError) {
                      return Center(
                        child: Image(
                          image: const AssetImage(
                              "assets/images/something went wrong-01.png"),
                          height: 200.h,
                          width: 200.w,
                        ),
                      );
                    }
                    if (state is GetHospitalLoaded) {
                      getHospitalModel =
                          BlocProvider.of<GetHospitalBloc>(context)
                              .getHospitalModel;
                      return ListView.builder(
                          itemCount: getHospitalModel.clinics!.length > 2
                              ? 2
                              : getHospitalModel.clinics!.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return HospitalCardWidget(
                              hospitalId: getHospitalModel
                                  .clinics![index].clinicId
                                  .toString(),
                              address: getHospitalModel.clinics![index].address
                                  .toString(),
                              department: getHospitalModel
                                  .clinics![index].specializations
                                  .toString(),
                              doctorCount: getHospitalModel
                                  .clinics![index].doctorCount
                                  .toString(),
                              image: getHospitalModel
                                  .clinics![index].clinicMainImage
                                  .toString(),
                              name: getHospitalModel.clinics![index].clinicName
                                  .toString(),
                              hospitalLocation: getHospitalModel
                                  .clinics![index].location
                                  .toString(),
                            );
                          });
                    }
                    return Container();
                  },
                ),
                const VerticalSpacingWidget(height: 10),
                //! article
                BlocBuilder<ArticleBloc, ArticleState>(
                  builder: (context, state) {
                    if (state is GetArticleLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: kMainColor,
                        ),
                      );
                    }
                    if (state is GetArticleError) {
                      return Center(
                        child: Image(
                          image: const AssetImage(
                              "assets/images/something went wrong-01.png"),
                          height: 200.h,
                          width: 200.w,
                        ),
                      );
                    }
                    if (state is GetArticleLoaded) {
                      getAllArticleModel = BlocProvider.of<ArticleBloc>(context)
                          .getAllArticleModel;
                      return getAllArticleModel.articles == null
                          ? Container()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Text(
                                    "Featured",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: kSubTextColor),
                                  ),
                                ),
                                const VerticalSpacingWidget(height: 5),
                                SizedBox(
                                  height: 200,
                                  width: double.infinity,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        getAllArticleModel.articles!.length,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left: 4.w, right: 4.w),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ArticleScreen(
                                                  articleDescription:
                                                      getAllArticleModel
                                                          .articles![index]
                                                          .articleDescription
                                                          .toString(),
                                                  articleImage:
                                                      getAllArticleModel
                                                          .articles![index]
                                                          .mainBanner
                                                          .toString(),
                                                  articleTitle:
                                                      getAllArticleModel
                                                          .articles![index]
                                                          .articleTitle
                                                          .toString(),
                                                  authorImage:
                                                      getAllArticleModel
                                                          .articles![index]
                                                          .authorImage
                                                          .toString(),
                                                  authorName: getAllArticleModel
                                                      .articles![index]
                                                      .authorName
                                                      .toString(),
                                                  categoryId: getAllArticleModel
                                                      .articles![index]
                                                      .categoryId
                                                      .toString(),
                                                  categoryName:
                                                      getAllArticleModel
                                                          .articles![index]
                                                          .categoryName
                                                          .toString(),
                                                ),
                                              ),
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              getAllArticleModel
                                                  .articles![index].bannerImage
                                                  .toString(),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                                const VerticalSpacingWidget(height: 10),
                              ],
                            );
                    }
                    return Container();
                  },
                ),
                const Image(
                  image: AssetImage("assets/images/mediezy.jpg"),
                ),
                const VerticalSpacingWidget(height: 10),
                // //! health symptoms
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 10.w),
                //   child: HeadingWidget(
                //     title: "Browse by Symptoms",
                //     viewAllFunction: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) =>
                //               const HealthSymptomsListingScreen(),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                // const VerticalSpacingWidget(height: 10),
                // BlocBuilder<GetHealthSymptomsBloc, GetHealthSymptomsState>(
                //     builder: (context, state) {
                //   if (state is GetHealthSymptomsLoading) {
                //     return SizedBox(
                //       height: 60.h,
                //       child: Center(
                //         child: CircularProgressIndicator(
                //           color: kMainColor,
                //         ),
                //       ),
                //     );
                //   }
                //   if (state is GetHealthSymptomsError) {
                //     return const Center(
                //       child: Text("Something went wrong"),
                //     );
                //   }
                //   if (state is GetHealthSymptomsLoaded) {
                //     getHealthSymptomsModel =
                //         BlocProvider.of<GetHealthSymptomsBloc>(context)
                //             .getHealthSymptomsModel;
                //     return SingleChildScrollView(
                //       child: Padding(
                //         padding: EdgeInsets.symmetric(horizontal: 10.w),
                //         child: GridView.builder(
                //           padding: EdgeInsets.zero,
                //           physics: const NeverScrollableScrollPhysics(),
                //           shrinkWrap: true,
                //           itemCount: 6,
                //           gridDelegate:
                //               const SliverGridDelegateWithFixedCrossAxisCount(
                //                   crossAxisCount: 3,
                //                   crossAxisSpacing: 10.0,
                //                   mainAxisSpacing: 10.0,
                //                   childAspectRatio: 0.70),
                //           itemBuilder: ((context, index) {
                //             return InkWell(
                //               onTap: () {
                //                 Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                     builder: (context) =>
                //                         DoctorByHealthSymptomsScreen(
                //                       healthSymptomsName:
                //                           getHealthSymptomsModel
                //                               .categories![index].categoryName
                //                               .toString(),
                //                       healthSymptomsId: getHealthSymptomsModel
                //                           .categories![index].id
                //                           .toString(),
                //                     ),
                //                   ),
                //                 );
                //               },
                //               child: ClipRRect(
                //                 borderRadius: BorderRadius.circular(10),
                //                 child: Image(
                //                   image: NetworkImage(
                //                     getHealthSymptomsModel
                //                         .categories![index].image
                //                         .toString(),
                //                   ),
                //                   width: 120.w,
                //                   fit: BoxFit.fill,
                //                 ),
                //               ),
                //             );
                //           }),
                //         ),
                //       ),
                //     );
                //   }
                //   return Container();
                // }),
                // const VerticalSpacingWidget(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
