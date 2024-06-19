

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Repository/Bloc/Favourites/AddFavourites/add_favourites_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/heading_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/view_all_button_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/doctor_favourite_card_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_screen_loading_widgets.dart';
import 'package:mediezy_user/Ui/Screens/ProfileScreen/SavedDoctorsScreen/saved_doctors_screen.dart';
import 'package:mediezy_user/ddd/application/get_docters/get_docters_bloc.dart';
import 'package:mediezy_user/ddd/application/get_fav_doctor/get_fav_doctor_bloc.dart';
import '../../../../ddd/application/get_recently_booked_doctor/get_recently_booked_doctor_bloc.dart';


class GetFavouriteDoctorWidget extends StatelessWidget {
  const GetFavouriteDoctorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavDoctorBloc, GetFavDoctorState>(
      builder: (context, state) {
        if (state.isloding) {
          return doctorCardMainLoadingWidget();
        }

        if (state.isError) {
          return Center(
            child: Image(
              image: const AssetImage("assets/images/something went wrong-01.png"),
              height: 200.h,
              width: 200.w,
            ),
          );
        }

        if (state.model.isEmpty) {
          return const SizedBox();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const HeadingWidget(
                title: "Your favourite doctors",
              ),
            ),
            const VerticalSpacingWidget(height: 5),
            LimitedBox(
              maxHeight: MediaQuery.of(context).size.height * .292,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.model.length,
                itemBuilder: (context, index) {
                  return DoctorFavouriteCardWidget(
                    clinicList: state.model[index].clinics!.toList(),
                    doctorId: state.model[index].userId.toString(),
                    firstName: state.model[index].firstname.toString(),
                    lastName: state.model[index].secondname.toString(),
                    imageUrl: state.model[index].docterImage.toString(),
                    mainHospitalName: state.model[index].mainHospital.toString(),
                    specialisation: state.model[index].specialization.toString(),
                    location: state.model[index].location.toString(),
                    favourites: GestureDetector(
                      onTap: () {
                        context.read<GetFavDoctorBloc>().add(GetFavDoctorEvent.changeFav(state.model[index].id!));
                        context.read<GetDoctersBloc>().add(const GetDoctersEvent.started(false));
                        context.read<AddFavouritesBloc>().add(
                          AddFavourites(
                            doctorId: state.model[index].userId.toString(),
                            favouriteStatus: state.favId,
                          ),
                        );
                        context.read<GetRecentlyBookedDoctorBloc>().add(const GetRecentlyBookedDoctorEvent.started(false));
                      },
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.028,
                        width: MediaQuery.of(context).size.width * 0.07,
                        child: Image.asset(
                          state.model[index].favoriteStatus == 1
                              ? "assets/icons/favorite1.png"
                              : "assets/icons/favorite2.png",
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const VerticalSpacingWidget(height: 2),
            ViewAllButtonWidget(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const SavedDoctorsScreen()),
                  ),
                );
              },
              buttonText: "View all favourite doctors",
            )
          ],
        );
      },
    );
  }
}