import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/GetRecentlyBookedDoctor/get_recently_booked_doctor_model.dart';
import 'package:mediezy_user/Repository/Bloc/GetRecentlyBookedDoctor/get_recently_booked_doctors_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/heading_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/view_all_button_widget.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/Widgets/doctor_card_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_screen_loading_widgets.dart';
import 'package:mediezy_user/Ui/Screens/ProfileScreen/RecentBookedDoctorsScreen/recent_booked_doctors_screen.dart';

class HomeRecentlyBookedDoctorWidget extends StatefulWidget {
  const HomeRecentlyBookedDoctorWidget({super.key});

  @override
  State<HomeRecentlyBookedDoctorWidget> createState() =>
      _HomeRecentlyBookedDoctorWidgetState();
}

class _HomeRecentlyBookedDoctorWidgetState
    extends State<HomeRecentlyBookedDoctorWidget> {
  late GetRecentlyBookedDoctorModel getRecentlyBookedDoctorModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRecentlyBookedDoctorsBloc,
        GetRecentlyBookedDoctorsState>(
      builder: (context, state) {
        if (state is GetRecentlyBookedDoctorLoading) {
          return doctorCardMainLoadingWidget();
        }
        if (state is GetRecentlyBookedDoctorError) {
          return Center(
            child: Image(
              image:
                  const AssetImage("assets/images/something went wrong-01.png"),
              height: 200.h,
              width: 200.w,
            ),
          );
        }
        if (state is GetRecentlyBookedDoctorLoaded) {
          getRecentlyBookedDoctorModel =
              BlocProvider.of<GetRecentlyBookedDoctorsBloc>(context)
                  .getRecentlyBookedDoctorModel;
          return getRecentlyBookedDoctorModel.recentlyBookedDoctor == null
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: const HeadingWidget(
                        title: "Recent booked doctors",
                      ),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: getRecentlyBookedDoctorModel
                                    .recentlyBookedDoctor!.length >
                                1
                            ? 1
                            : getRecentlyBookedDoctorModel
                                .recentlyBookedDoctor!.length,
                        itemBuilder: (context, index) {
                          return DoctorCardWidget(
                            clinicList: getRecentlyBookedDoctorModel
                                .recentlyBookedDoctor![index].clinics!
                                .toList(),
                            doctorId: getRecentlyBookedDoctorModel
                                .recentlyBookedDoctor![index].userId
                                .toString(),
                            firstName: getRecentlyBookedDoctorModel
                                .recentlyBookedDoctor![index].firstname
                                .toString(),
                            lastName: getRecentlyBookedDoctorModel
                                .recentlyBookedDoctor![index].secondname
                                .toString(),
                            imageUrl: getRecentlyBookedDoctorModel
                                .recentlyBookedDoctor![index].docterImage
                                .toString(),
                            mainHospitalName: getRecentlyBookedDoctorModel
                                .recentlyBookedDoctor![index].mainHospital
                                .toString(),
                            specialisation: getRecentlyBookedDoctorModel
                                .recentlyBookedDoctor![index].specialization
                                .toString(),
                            location: getRecentlyBookedDoctorModel
                                .recentlyBookedDoctor![index].location
                                .toString(),
                          );
                        }),
                    const VerticalSpacingWidget(height: 2),
                    ViewAllButtonWidget(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) =>
                                  const RecentBookedDoctorsScreen()),
                            ),
                          );
                        },
                        buttonText: "view all recently booked doctors")
                  ],
                );
        }
        return Container();
      },
    );
  }
}
