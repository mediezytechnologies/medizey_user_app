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

class GetFavouriteDoctorWidget extends StatefulWidget {
  const GetFavouriteDoctorWidget({super.key});

  @override
  State<GetFavouriteDoctorWidget> createState() =>
      _GetFavouriteDoctorWidgetState();
}

class _GetFavouriteDoctorWidgetState extends State<GetFavouriteDoctorWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<GetFavDoctorBloc, GetFavDoctorState>(
      listener: (context, state) {
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
      },
      builder: (context, state) {
        if (state.isloding) {
          return doctorCardMainLoadingWidget();
        }
        return state.model.isEmpty
            ? const SizedBox()
            : Column(
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
                    maxHeight: size.height * .289,
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
                            mainHospitalName:
                                state.model[index].mainHospital.toString(),
                            specialisation:
                                state.model[index].specialization.toString(),
                            location: state.model[index].location.toString(),
                            favourites: GestureDetector(
                              onTap: () {
                                setState(() {
                                  BlocProvider.of<GetFavDoctorBloc>(context)
                                      .add(const GetFavDoctorEvent.started(
                                          false));
                                  BlocProvider.of<GetDoctersBloc>(context).add(
                                      const GetDoctersEvent.started(false));
                                  BlocProvider.of<GetFavDoctorBloc>(context)
                                      .add(GetFavDoctorEvent.changeFav(
                                          state.model[index].id!));
                                  BlocProvider.of<AddFavouritesBloc>(context)
                                      .add(
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
                          );
                        }),
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
                      buttonText: "View all favourite doctors")
                ],
              );
      },
    );
  }
}
