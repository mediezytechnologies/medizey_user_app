import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/heading_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/view_all_button_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/AllDoctorsNearYouScreen/all_doctors_near_you_screen.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/doctor_near_you_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_screen_loading_widgets.dart';
import '../../../../Repository/Bloc/Favourites/AddFavourites/add_favourites_bloc.dart';
import '../../../../ddd/application/get_docters/get_docters_bloc.dart';
import '../../../../ddd/application/get_fav_doctor/get_fav_doctor_bloc.dart';

class GetDoctorWidget extends StatefulWidget {
  const GetDoctorWidget({super.key});

  @override
  State<GetDoctorWidget> createState() => _GetDoctorWidgetState();
}

class _GetDoctorWidgetState extends State<GetDoctorWidget> {
  @override
  void initState() {
    BlocProvider.of<GetDoctersBloc>(context)
        .add(const GetDoctersEvent.started(true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<GetDoctersBloc, GetDoctersState>(
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
          return doctorNearYouLoadingWidget(context);
        }
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
                maxHeight: size.height * .255,
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
                                  .add(const GetFavDoctorEvent.started(false));
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
                        builder: ((context) => const AllDoctorNearYouScreen()),
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
