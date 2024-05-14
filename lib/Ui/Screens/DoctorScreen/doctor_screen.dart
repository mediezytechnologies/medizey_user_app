// ignore_for_file: deprecated_member_use

import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetSpecialisations/GetAllSpecialisations/get_all_specialisations_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthCategories/GetHealthCategories/get_health_categories_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/banner/banner_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/bottom_navigation_control_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/Widgets/custome_app_bar.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/Widgets/get_banner_widget.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/Widgets/get_specialisation_widget.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/Widgets/home_helath_concern_widget.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/Widgets/home_recently_booked_doctor_widget.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  void initState() {
    BlocProvider.of<GetHealthCategoriesBloc>(context)
        .add(FetchHealthCategories());
    BlocProvider.of<GetAllSpecialisationsBloc>(context)
        .add(FetchAllSpecialisations());
    BlocProvider.of<BannerBloc>(context).add(FetchBannerEvent(type: "2"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigationControlWidget(),
          ),
        );
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: FadedSlideAnimation(
            beginOffset: const Offset(0, 0.3),
            endOffset: const Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
            child: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomeAppBar(),
                  VerticalSpacingWidget(height: 5),
                  GetSpecialisationWidget(),
                  VerticalSpacingWidget(height: 5),
                  HomeHealthConcernWidget(),
                  HomeRecentlyBookedDoctorWidget(),
                  VerticalSpacingWidget(height: 5),
                  GetBannerWidget(),
                  VerticalSpacingWidget(height: 5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
