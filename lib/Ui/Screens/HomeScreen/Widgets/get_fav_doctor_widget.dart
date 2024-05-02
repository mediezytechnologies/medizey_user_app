import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/GetFavourites/get_favourites_model.dart';
import 'package:mediezy_user/Repository/Bloc/Favourites/GetFavourites/get_favourites_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/heading_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/view_all_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/doctor_card_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_screen_loading_widgets.dart';
import 'package:mediezy_user/Ui/Screens/ProfileScreen/SavedDoctorsScreen/saved_doctors_screen.dart';

import '../../../../Repository/Bloc/Favourites/AddFavourites/add_favourites_bloc.dart';
import '../../../../ddd/application/get_docters/get_docters_bloc.dart';
import '../../../../ddd/application/get_fav_doctor/get_fav_doctor_bloc.dart';
import '../../../CommonWidgets/doctor_card_widget_2.dart';

class GetFavDoctorWidget extends StatefulWidget {
  const GetFavDoctorWidget({super.key});

  @override
  State<GetFavDoctorWidget> createState() => _GetFavDoctorWidgetState();
}

class _GetFavDoctorWidgetState extends State<GetFavDoctorWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //late GetFavouritesModel getFavouritesModel;
  @override
  Widget build(BuildContext context) {    final size = MediaQuery.of(context).size;
    return BlocConsumer<GetFavDoctorBloc, GetFavDoctorState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const HeadingWidget(
                title: "Your mahesh favourite doctors",
              ),
            ),
            const VerticalSpacingWidget(height: 5),
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.model.length > 1 ? 1 : state.model.length,
                itemBuilder: (context, index) {
                  return DoctorCardWidget2(
                    userAwayFrom:
                        state.model[index].distanceFromUser.toString(),
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
                      favurates: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        BlocProvider.of<GetDoctersBloc>(context)
                                            .add(GetDoctersEvent.changeFav(
                                                state.model[index].id!));
                                        BlocProvider.of<AddFavouritesBloc>(
                                                context)
                                            .add(
                                          AddFavourites(
                                            doctorId: state.model[index].userId
                                                .toString(),
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
                                        color: kMainColor,
                                        // color: const Color.fromARGB(
                                        //     255, 197, 120, 120),
                                      ),
                                    ),
                                  ),
                     onTap: () {
                                    BlocProvider.of<GetDoctersBloc>(context)
                                        .add(GetDoctersEvent.changeFav(state
                                            .model[index].favoriteStatus!));
                                    BlocProvider.of<AddFavouritesBloc>(context)
                                        .add(
                                      AddFavourites(
                                        doctorId: state.model[index].userId
                                            .toString(),
                                        favouriteStatus: state.favId,
                                      ),
                                    );
                                    BlocProvider.of<GetDoctersBloc>(context)
                                        .add(GetDoctersEvent.started());
                                  },
                    // img: state.model[index].favoriteStatus == 1
                    //     ? "assets/icons/favorite1.png"
                    //     : "assets/icons/favorite2.png",
                    // onTap: () {
                    //   setState(() {
                    //     BlocProvider.of<GetFavDoctorBloc>(context)
                    //         .add(GetFavDoctorEvent.started());
                    //     BlocProvider.of<GetDoctersBloc>(context).add(
                    //         GetDoctersEvent.changeFav(state.model[index].id!));
                    //     BlocProvider.of<AddFavouritesBloc>(context).add(
                    //       AddFavourites(
                    //         doctorId: state.model[index].userId.toString(),
                    //         favouriteStatus: state.favId,
                    //       ),
                    //     );
                    //     BlocProvider.of<GetFavouritesBloc>(context)
                    //         .add(FetchAllFavourites());
                    //   });
                    // },
                  );
                }),
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

    // return BlocBuilder<GetFavouritesBloc, GetFavouritesState>(
    //   builder: (context, state) {
    //     if (state is GetAllFavouritesLoading) {
    //       return doctorCardMainLoadingWidget();
    //     }
    //     if (state is GetAllFavouritesError) {
    //       return Container();
    //     }
    //     if (state is GetAllFavouritesLoaded) {
    //       getFavouritesModel =
    //           BlocProvider.of<GetFavouritesBloc>(context).getFavouritesModel;
    //       return getFavouritesModel.favoriteDoctors!.isEmpty
    //           ? Container()
    //           : Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 10.w),
    //                   child: const HeadingWidget(
    //                     title: "Your favourite doctors",
    //                   ),
    //                 ),
    //                 const VerticalSpacingWidget(height: 5),
    //                 ListView.builder(
    //                     padding: EdgeInsets.zero,
    //                     shrinkWrap: true,
    //                     physics: const NeverScrollableScrollPhysics(),
    //                     itemCount:
    //                         getFavouritesModel.favoriteDoctors!.length > 1
    //                             ? 1
    //                             : getFavouritesModel.favoriteDoctors!.length,
    //                     itemBuilder: (context, index) {
    //                       return DoctorCardWidget(
    //                           userAwayFrom: getFavouritesModel
    //                               .favoriteDoctors![index].distanceFromUser
    //                               .toString(),
    //                           clinicList: getFavouritesModel.favoriteDoctors![index].clinics!
    //                               .toList(),
    //                           doctorId: getFavouritesModel.favoriteDoctors![index].userId
    //                               .toString(),
    //                           firstName: getFavouritesModel
    //                               .favoriteDoctors![index].firstname
    //                               .toString(),
    //                           lastName: getFavouritesModel
    //                               .favoriteDoctors![index].secondname
    //                               .toString(),
    //                           imageUrl: getFavouritesModel
    //                               .favoriteDoctors![index].docterImage
    //                               .toString(),
    //                           mainHospitalName: getFavouritesModel
    //                               .favoriteDoctors![index].mainHospital
    //                               .toString(),
    //                           specialisation: getFavouritesModel
    //                               .favoriteDoctors![index].specialization
    //                               .toString(),
    //                           location: getFavouritesModel.favoriteDoctors![index].location.toString());
    //                     }),
    //                 const VerticalSpacingWidget(height: 2),
    //                 ViewAllButtonWidget(
    //                     onTap: () {
    //                       Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                           builder: ((context) =>
    //                               const SavedDoctorsScreen()),
    //                         ),
    //                       );
    //                     },
    //                     buttonText: "View all favourite doctors")
    //               ],
    //             );
    //     }
    //     return Container();
    //   },
    // );
  }
}
