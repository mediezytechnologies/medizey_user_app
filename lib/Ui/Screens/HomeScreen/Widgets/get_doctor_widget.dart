
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/Doctor/doctor_model.dart';
import 'package:mediezy_user/Repository/Bloc/GetDoctor/GetDoctors/get_doctor_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/heading_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/view_all_button_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/AllDoctorsNearYouScreen/all_dcotors_near_you_screen.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/doctor_near_you_widget.dart';

class GetDoctorWidget extends StatefulWidget {
  const GetDoctorWidget({super.key});

  @override
  State<GetDoctorWidget> createState() => _GetDoctorWidgetState();
}

class _GetDoctorWidgetState extends State<GetDoctorWidget> {
  late DoctorModel doctorModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDoctorBloc, GetDoctorState>(
      builder: (context, state) {
        if (state is GetDoctorLoaded) {
          doctorModel = BlocProvider.of<GetDoctorBloc>(context).doctorModel;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadingWidget(
                  title: "Doctors near you",
                ),
                const VerticalSpacingWidget(height: 5),
                LimitedBox(
                  maxHeight: 210.h,
                  //    height: 187.h,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: doctorModel.allDoctors!.length,
                      itemBuilder: (context, index) {
                      //  log('message ${Axis.horizontal}');
                        return DoctorNearYouWidget(
                            docterDistance: doctorModel
                                .allDoctors![index].distanceFromUser!,
                            doctorId: doctorModel.allDoctors![index].userId
                                .toString(),
                            firstName: doctorModel.allDoctors![index].firstname
                                .toString(),
                            lastName: doctorModel.allDoctors![index].secondname
                                .toString(),
                            imageUrl: doctorModel.allDoctors![index].docterImage
                                .toString(),
                            location: doctorModel.allDoctors![index].location
                                .toString(),
                            specialisation: doctorModel
                                .allDoctors![index].specialization
                                .toString(),
                            favouriteStatus: doctorModel
                                .allDoctors![index].favoriteStatus!
                                .toInt());
                      }),
                ),
                const VerticalSpacingWidget(height: 5),
                ViewAllButtonWidget(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) =>
                              const AllDoctorNearYouScreen()),
                        ),
                      );
                    },
                    buttonText: "View all doctors")
              ],
            ),
          );
        }
        if (state is GetDoctorLoading) {
          return SizedBox(
            height: 60.h,
            child: Center(
              child: CircularProgressIndicator(
                color: kMainColor,
              ),
            ),
          );
        }
        if (state is GetDoctorError) {
          return Container();
        }
        return Container();
      },
    );
  }
}
