import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/heading_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/view_all_button_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/AllDoctorsNearYouScreen/all_docters_near_you_screen_2.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/doctor_near_you_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/home_screen.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import '../../../../Repository/Bloc/Favourites/AddFavourites/add_favourites_bloc.dart';
import '../../../../Repository/Bloc/Favourites/GetFavourites/get_favourites_bloc.dart';
import '../../../../ddd/application/get_docters/get_docters_bloc.dart';
import '../../../../ddd/application/get_fav_doctor/get_fav_doctor_bloc.dart';
import '../../../Consts/app_colors.dart';

class GetDoctorWidget extends StatefulWidget {
  const GetDoctorWidget({super.key});

  @override
  State<GetDoctorWidget> createState() => _GetDoctorWidgetState();
}

class _GetDoctorWidgetState extends State<GetDoctorWidget> {
  // late DoctorModel doctorModel;
  @override
  void initState() {
    BlocProvider.of<GetDoctersBloc>(context).add(GetDoctersEvent.started());
    super.initState();
  }

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
                  maxHeight: 195.h,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: doctorModel.allDoctors!.length,
                      itemBuilder: (context, index) {
                        return DoctorNearYouWidget(
                            docterDistance: doctorModel
                                    .allDoctors![index].distanceFromUser ??
                                "0.0",
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
                    buttonText: "View near you doctors")
              ],
            ),
          );
        }
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
        if (state.isloding) {
          Center(
            child: CupertinoActivityIndicator(
              color: kMainColor,
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingWidget(
                title: "Doctors near you dfbg",
              ),
              const VerticalSpacingWidget(height: 5),
              LimitedBox(
                maxHeight: 260.h,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.model.length,
                    itemBuilder: (context, index) {
                      return DoctorNearYouWidget(
                          img: state.model[index].favoriteStatus == 1
                              ? "assets/icons/favorite1.png"
                              : "assets/icons/favorite2.png",
                          onTap: () {
                            setState(() {
                              BlocProvider.of<GetFavDoctorBloc>(context)
                                  .add(GetFavDoctorEvent.started());
                              BlocProvider.of<GetDoctersBloc>(context).add(
                                  GetDoctersEvent.changeFav(
                                      state.model[index].id!));
                              BlocProvider.of<AddFavouritesBloc>(context).add(
                                AddFavourites(
                                  doctorId:
                                      state.model[index].userId.toString(),
                                  favouriteStatus: state.favId,
                                ),
                              );
                              BlocProvider.of<GetFavouritesBloc>(context)
                                  .add(FetchAllFavourites());
                            });
                          },
                          docterDistance:
                              state.model[index].distanceFromUser ?? "0.0",
                          doctorId: state.model[index].userId.toString(),
                          firstName: state.model[index].firstname.toString(),
                          lastName: state.model[index].secondname.toString(),
                          imageUrl: state.model[index].docterImage.toString(),
                          location: state.model[index].location.toString(),
                          specialisation:
                              state.model[index].specialization.toString(),
                          favouriteStatus: state.model[index].favoriteStatus!);
                    }),
              ),
              const VerticalSpacingWidget(height: 5),
              ViewAllButtonWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const AllDoctorNearYouScreen2()),
                      ),
                    );
                  },
                  buttonText: "View near you doctors")
            ],
          ),
        );
      },
    );
  }
}
