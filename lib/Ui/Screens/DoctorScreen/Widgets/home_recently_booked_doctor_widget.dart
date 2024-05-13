import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/heading_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/view_all_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/doctor_card_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_screen_loading_widgets.dart';
import 'package:mediezy_user/Ui/Screens/ProfileScreen/RecentBookedDoctorsScreen/recent_booked_doctors_screen.dart';
import '../../../../Repository/Bloc/Favourites/AddFavourites/add_favourites_bloc.dart';
import '../../../../ddd/application/get_docters/get_docters_bloc.dart';
import '../../../../ddd/application/get_fav_doctor/get_fav_doctor_bloc.dart';
import '../../../../ddd/application/get_recently_booked_doctor/get_recently_booked_doctor_bloc.dart';

class HomeRecentlyBookedDoctorWidget extends StatefulWidget {
  const HomeRecentlyBookedDoctorWidget({super.key});

  @override
  State<HomeRecentlyBookedDoctorWidget> createState() =>
      _HomeRecentlyBookedDoctorWidgetState();
}

class _HomeRecentlyBookedDoctorWidgetState
    extends State<HomeRecentlyBookedDoctorWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<GetRecentlyBookedDoctorBloc,
        GetRecentlyBookedDoctorState>(listener: (context, state) {
      if (state.isError) {
        Center(
          child: Image(
            image:
                const AssetImage("assets/images/something went wrong-01.png"),
            height: 200.h,
            width: 200.w,
          ),
        );
      }
    }, builder: (context, state) {
      if (state.isloding) {
        return doctorCardMainLoadingWidget();
      }
      return state.model.isEmpty
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
                    itemCount: state.model.length > 1 ? 1 : state.model.length,
                    itemBuilder: (context, index) {
                      final doctor = state.model[index];
                      return DoctorCardWidget(
                        favourites: GestureDetector(
                          onTap: () {
                            setState(() {
                              BlocProvider.of<GetRecentlyBookedDoctorBloc>(
                                      context)
                                  .add(const GetRecentlyBookedDoctorEvent
                                      .getRecentlyBookedDocterForcedEvent());
                              BlocProvider.of<GetFavDoctorBloc>(context).add(
                                  const GetFavDoctorEvent
                                      .getFavDocterForcedEvent());
                              BlocProvider.of<GetDoctersBloc>(context).add(
                                  const GetDoctersEvent
                                      .getDoctersForcedEvent());
                              BlocProvider.of<GetRecentlyBookedDoctorBloc>(
                                      context)
                                  .add(GetRecentlyBookedDoctorEvent.changeFav(
                                      state.model[index].id!));
                              BlocProvider.of<AddFavouritesBloc>(context).add(
                                AddFavourites(
                                  doctorId:
                                      state.model[index].userId.toString(),
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
                            ),
                          ),
                        ),
                        clinicList: doctor.clinics!.toList(),
                        doctorId: doctor.userId.toString(),
                        firstName: doctor.firstname.toString(),
                        lastName: doctor.secondname.toString(),
                        imageUrl: doctor.docterImage.toString(),
                        mainHospitalName: doctor.mainHospital.toString(),
                        specialisation: doctor.specialization.toString(),
                        location: doctor.location.toString(),
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
                    buttonText: "View all recently booked doctors")
              ],
            );
    });
  }
}
