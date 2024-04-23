import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/GetFavourites/get_favourites_model.dart';
import 'package:mediezy_user/Repository/Bloc/Favourites/GetFavourites/get_favourites_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/heading_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/view_all_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/doctor_card_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_screen_loading_widgets.dart';
import 'package:mediezy_user/Ui/Screens/ProfileScreen/SavedDoctorsScreen/saved_doctors_screen.dart';

class GetFavouriteDoctorWidget extends StatefulWidget {
  const GetFavouriteDoctorWidget({super.key});

  @override
  State<GetFavouriteDoctorWidget> createState() =>
      _GetFavouriteDoctorWidgetState();
}

class _GetFavouriteDoctorWidgetState extends State<GetFavouriteDoctorWidget> {
  late GetFavouritesModel getFavouritesModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavouritesBloc, GetFavouritesState>(
      builder: (context, state) {
        if (state is GetAllFavouritesLoading) {
          return doctorCardMainLoadingWidget();
        }
        if (state is GetAllFavouritesError) {
          return Container();
        }
        if (state is GetAllFavouritesLoaded) {
          getFavouritesModel =
              BlocProvider.of<GetFavouritesBloc>(context).getFavouritesModel;
          return getFavouritesModel.favoriteDoctors!.isEmpty
              ? Container()
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
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            getFavouritesModel.favoriteDoctors!.length > 1
                                ? 1
                                : getFavouritesModel.favoriteDoctors!.length,
                        itemBuilder: (context, index) {
                          return DoctorCardWidget(
                              userAwayFrom: getFavouritesModel
                                  .favoriteDoctors![index].distanceFromUser
                                  .toString(),
                              clinicList: getFavouritesModel.favoriteDoctors![index].clinics!
                                  .toList(),
                              doctorId: getFavouritesModel.favoriteDoctors![index].userId
                                  .toString(),
                              firstName: getFavouritesModel
                                  .favoriteDoctors![index].firstname
                                  .toString(),
                              lastName: getFavouritesModel
                                  .favoriteDoctors![index].secondname
                                  .toString(),
                              imageUrl: getFavouritesModel
                                  .favoriteDoctors![index].docterImage
                                  .toString(),
                              mainHospitalName: getFavouritesModel
                                  .favoriteDoctors![index].mainHospital
                                  .toString(),
                              specialisation: getFavouritesModel
                                  .favoriteDoctors![index].specialization
                                  .toString(),
                              location: getFavouritesModel.favoriteDoctors![index].location.toString());
                        }),
                    const VerticalSpacingWidget(height: 2),
                    ViewAllButtonWidget(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) =>
                                  const SavedDoctorsScreen()),
                            ),
                          );
                        },
                        buttonText: "View all favourite doctors")
                  ],
                );
        }
        return Container();
      },
    );
  }
}
