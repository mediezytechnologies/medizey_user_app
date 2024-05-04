import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/heading_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/view_all_button_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/ProfileScreen/SavedDoctorsScreen/saved_doctors_screen.dart';

import '../../../../Repository/Bloc/Favourites/AddFavourites/add_favourites_bloc.dart';
import '../../../../ddd/application/get_docters/get_docters_bloc.dart';
import '../../../../ddd/application/get_fav_doctor/get_fav_doctor_bloc.dart';
import '../../../CommonWidgets/doctor_card_widget.dart';

class GetFavDoctorWidget extends StatefulWidget {
  const GetFavDoctorWidget({super.key});

  @override
  State<GetFavDoctorWidget> createState() => _GetFavDoctorWidgetState();
}

class _GetFavDoctorWidgetState extends State<GetFavDoctorWidget> {

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
                  return DoctorCardWidget(
                                  // onTap: () {
                                  //   BlocProvider.of<GetDoctersBloc>(context)
                                  //       .add(GetDoctersEvent.changeFav(state
                                  //           .model[index].favoriteStatus!));
                                  //   BlocProvider.of<AddFavouritesBloc>(context)
                                  //       .add(
                                  //     AddFavourites(
                                  //       doctorId: state.model[index].userId
                                  //           .toString(),
                                  //       favouriteStatus: state.favId,
                                  //     ),
                                  //   );
                                  //   BlocProvider.of<GetDoctersBloc>(context)
                                  //       .add(GetDoctersEvent.started());
                                  // },
                                  userAwayFrom: "2.2",
                                  clinicList:
                                      state.model[index].clinics!.toList(),
                                  doctorId:
                                      state.model[index].userId.toString(),
                                  firstName:
                                      state.model[index].firstname.toString(),
                                  lastName:
                                      state.model[index].secondname.toString(),
                                  imageUrl:
                                      state.model[index].docterImage.toString(),
                                  mainHospitalName: state
                                      .model[index].mainHospital
                                      .toString(),
                                  specialisation: state
                                      .model[index].specialization
                                      .toString(),
                                  location:
                                      state.model[index].location.toString(),
                                  // favurates: GestureDetector(
                                  //   onTap: () {
                                  //     setState(() {
                                  //       BlocProvider.of<GetFavDoctorBloc>(context)
                                  // .add(GetFavDoctorEvent.started());
                                  //       BlocProvider.of<GetDoctersBloc>(context)
                                  //           .add(GetDoctersEvent.changeFav(
                                  //               state.model[index].id!));
                                  //       BlocProvider.of<AddFavouritesBloc>(
                                  //               context)
                                  //           .add(
                                  //         AddFavourites(
                                  //           doctorId: state.model[index].userId
                                  //               .toString(),
                                  //           favouriteStatus: state.favId,
                                  //         ),
                                  //       );
                                  //     });
                                  //   },
                                    // child: Container(
                                    //   color: Colors.amber,
                                    //   height: size.height * 0.028,
                                    //   width: size.width * 0.07,
                                    //   child: Image.asset(
                                    //     state.model[index].favoriteStatus == 1
                                    //         ? "assets/icons/favorite1.png"
                                    //         : "assets/icons/favorite2.png",
                                    //     color: kMainColor,
                                    //     // color: const Color.fromARGB(
                                    //     //     255, 197, 120, 120),
                                    //   ),
                                    // ),
                                //  ),
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

   
  }
}
