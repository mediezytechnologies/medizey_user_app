// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_intro_card.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_screen_loading_widgets.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/hospital_card_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/upcoming_appoiment.dart';
import 'package:mediezy_user/Ui/Screens/ProfileScreen/RecentBookedDoctorsScreen/recent_booked_doctors_screen.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';

import 'Widgets/home_appbar_widget.dart';

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

  ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
          //backgroundColor: Colors.white,
       backgroundColor: const Color(0xFF4cb499),
            body:
               

                ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (context, index, _) {
            return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height*0.06,),
                        const HomeIntroCard(),
                    
                      
                        Container(
                             width: double.infinity,
                              color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03),
                                child:  Column(
                                  children: [
                                      VerticalSpacingWidget(height: 10.h),
                                    const RecommendedDoctorCard(),
                                    const VerticalSpacingWidget(height: 5),
                                    const UpcommingAppoiment(),
                                    const VerticalSpacingWidget(height: 5),
                                  ],
                                ),
                              ), BlocBuilder<GetHealthCategoriesBloc,
                            GetHealthCategoriesState>(
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
                                  BlocProvider.of<GetHealthCategoriesBloc>(
                                          context)
                                      .getHealthCategoriesModel;
                              return getHealthCategoriesModel
                                      .categories!.isEmpty
                                  ? Container()
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //! health concern
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Text(
                                            "Browse by health concern",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                                color: kSubTextColor),
                                          ),
                                        ),
                                        const VerticalSpacingWidget(
                                            height: 5),
                                        GridView.builder(
                                            padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 6),
                                            itemCount:
                                                getHealthCategoriesModel
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
                                                title:
                                                    getHealthCategoriesModel
                                                        .categories![index]
                                                        .categoryName
                                                        .toString(),
                                                imageUrl:
                                                    getHealthCategoriesModel
                                                        .categories![index]
                                                        .image
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
                              getRecentlyBookedDoctorModel = BlocProvider.of<
                                      GetRecentlyBookedDoctorsBloc>(context)
                                  .getRecentlyBookedDoctorModel;
                              return getRecentlyBookedDoctorModel
                                          .recentlyBookedDoctor ==
                                      null
                                  ? Container()
                                  : Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
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
                                        const VerticalSpacingWidget(
                                            height: 5),
                                        ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: getRecentlyBookedDoctorModel
                                                        .recentlyBookedDoctor!
                                                        .length >
                                                    2
                                                ? 2
                                                : getRecentlyBookedDoctorModel
                                                    .recentlyBookedDoctor!
                                                    .length,
                                            itemBuilder: (context, index) {
                                              return DoctorCardWidget(
                                                clinicList:
                                                    getRecentlyBookedDoctorModel
                                                        .recentlyBookedDoctor![
                                                            index]
                                                        .clinics!
                                                        .toList(),
                                                doctorId:
                                                    getRecentlyBookedDoctorModel
                                                        .recentlyBookedDoctor![
                                                            index]
                                                        .userId
                                                        .toString(),
                                                firstName:
                                                    getRecentlyBookedDoctorModel
                                                        .recentlyBookedDoctor![
                                                            index]
                                                        .firstname
                                                        .toString(),
                                                lastName:
                                                    getRecentlyBookedDoctorModel
                                                        .recentlyBookedDoctor![
                                                            index]
                                                        .secondname
                                                        .toString(),
                                                imageUrl:
                                                    getRecentlyBookedDoctorModel
                                                        .recentlyBookedDoctor![
                                                            index]
                                                        .docterImage
                                                        .toString(),
                                                mainHospitalName:
                                                    getRecentlyBookedDoctorModel
                                                        .recentlyBookedDoctor![
                                                            index]
                                                        .mainHospital
                                                        .toString(),
                                                specialisation:
                                                    getRecentlyBookedDoctorModel
                                                        .recentlyBookedDoctor![
                                                            index]
                                                        .specialization
                                                        .toString(),
                                                location:
                                                    getRecentlyBookedDoctorModel
                                                        .recentlyBookedDoctor![
                                                            index]
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
                        
                        const VerticalSpacingWidget(height: 10),
                        //! suggestion box
                        Stack(
                          children: [
                            const Image(
                              image:
                                  AssetImage("assets/images/suggestion.jpg"),
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
                                        fontSize: 13.sp,
                                        color: kSubTextColor),
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
                                      BlocProvider.of<SuggestionBloc>(context)
                                          .add(
                                        FetchSuggestions(
                                            message:
                                                suggestionController.text),
                                      );
                                      suggestionController.clear();
                                    },
                                    child: Container(
                                      height: 30.h,
                                      width: 90.w,
                                      decoration: BoxDecoration(
                                        color: kCardColor,
                                        borderRadius:
                                            BorderRadius.circular(10),
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
                                  builder: (context) =>
                                      const HospitalListingScreen(),
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
                                  itemCount:
                                      getHospitalModel.clinics!.length > 2
                                          ? 2
                                          : getHospitalModel.clinics!.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics:
                                      const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return HospitalCardWidget(
                                      hospitalId: getHospitalModel
                                          .clinics![index].clinicId
                                          .toString(),
                                      address: getHospitalModel
                                          .clinics![index].address
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
                                      name: getHospitalModel
                                          .clinics![index].clinicName
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
                              getAllArticleModel =
                                  BlocProvider.of<ArticleBloc>(context)
                                      .getAllArticleModel;
                              return getAllArticleModel.articles == null
                                  ? Container()
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.w),
                                          child: Text(
                                            "Featured",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                                color: kSubTextColor),
                                          ),
                                        ),
                                        const VerticalSpacingWidget(
                                            height: 5),
                                        SizedBox(
                                          height: 200,
                                          width: double.infinity,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: getAllArticleModel
                                                .articles!.length,
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
                                                                  .articles![
                                                                      index]
                                                                  .articleDescription
                                                                  .toString(),
                                                          articleImage:
                                                              getAllArticleModel
                                                                  .articles![
                                                                      index]
                                                                  .mainBanner
                                                                  .toString(),
                                                          articleTitle:
                                                              getAllArticleModel
                                                                  .articles![
                                                                      index]
                                                                  .articleTitle
                                                                  .toString(),
                                                          authorImage:
                                                              getAllArticleModel
                                                                  .articles![
                                                                      index]
                                                                  .authorImage
                                                                  .toString(),
                                                          authorName:
                                                              getAllArticleModel
                                                                  .articles![
                                                                      index]
                                                                  .authorName
                                                                  .toString(),
                                                          categoryId:
                                                              getAllArticleModel
                                                                  .articles![
                                                                      index]
                                                                  .categoryId
                                                                  .toString(),
                                                          categoryName:
                                                              getAllArticleModel
                                                                  .articles![
                                                                      index]
                                                                  .categoryName
                                                                  .toString(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      getAllArticleModel
                                                          .articles![index]
                                                          .bannerImage
                                                          .toString(),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        ),
                                        const VerticalSpacingWidget(
                                            height: 10),
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
                            ],
                          ),
                        ),
                    
                       
                        // //! health symptoms
                      ],
                    ),

                    scrollNotifier.value==true?
                 const HomeAappBar():const SizedBox(),

                  ],
                ));
          },
        )

            //  ),
            ),
      ),
    );
  }
}
