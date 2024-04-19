import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/GetSpecialisations/get_specialisations_model.dart';
import 'package:mediezy_user/Repository/Bloc/GetSpecialisations/GetAllSpecialisations/get_all_specialisations_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/heading_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/view_all_button_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/DoctorsBySpecialisationScreen/doctors_by_specialisation_screen.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/SpecialisationsScreen/specialisations_Screen.dart';

class GetSpecialisationWidget extends StatefulWidget {
  const GetSpecialisationWidget({super.key});

  @override
  State<GetSpecialisationWidget> createState() =>
      _GetSpecialisationWidgetState();
}

class _GetSpecialisationWidgetState extends State<GetSpecialisationWidget> {
  late GetSpecialisationsModel getSpecialisationModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllSpecialisationsBloc, GetAllSpecialisationsState>(
        builder: (context, state) {
      if (state is GetAllSpecialisationsError) {
        return Center(
          child: Image(
            image:
                const AssetImage("assets/images/something went wrong-01.png"),
            height: 200.h,
            width: 200.w,
          ),
        );
      }
      if (state is GetAllSpecialisationsLoading) {
        return Center(
          child: CircularProgressIndicator(
            color: kMainColor,
          ),
        );
      }
      if (state is GetAllSpecialisationsLoaded) {
        getSpecialisationModel =
            BlocProvider.of<GetAllSpecialisationsBloc>(context)
                .getSpecialisationsModel;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const HeadingWidget(title: "Find by specialisations"),
            ),
            const VerticalSpacingWidget(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SizedBox(
                height: 140.h,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: getSpecialisationModel.specializations!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 8.w, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DoctorsBySpecialisationScreen(
                                  specialisationName: getSpecialisationModel
                                      .specializations![index].specialization
                                      .toString(),
                                  specialisationId: getSpecialisationModel
                                      .specializations![index].id
                                      .toString(),
                                ),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FancyShimmerImage(
                              width: 120.w,
                              boxFit: BoxFit.fill,
                              errorWidget: const Image(
                                image: AssetImage("assets/icons/no image.png"),
                              ),
                              imageUrl: getSpecialisationModel
                                  .specializations![index].specializeimage
                                  .toString(),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            const VerticalSpacingWidget(height: 5),
            ViewAllButtonWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const SpecialisationsScreen()),
                    ),
                  );
                },
                buttonText: "View all specialisations")
          ],
        );
      }
      return Container();
    });
  }
}
