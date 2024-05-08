import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Repository/Bloc/Favourites/AddFavourites/add_favourites_bloc.dart';
import '../../../../CommonWidgets/horizontal_spacing_widget.dart';
import '../../../../CommonWidgets/text_style_widget.dart';
import '../../../../CommonWidgets/vertical_spacing_widget.dart';
import '../../../../Consts/app_colors.dart';

class DoctorDetailsFirstWidget extends StatelessWidget {
  const DoctorDetailsFirstWidget(
      {super.key,
      required this.image,
      required this.firstName,
      required this.secondName,
      required this.specialization,
      required this.location,
      required this.mainHospital,
      required this.distanceFromUser,
      required this.doctorId,
      required this.favouriteStatus});

  final String image;
  final String firstName;
  final String secondName;
  final String specialization;
  final String location;
  final String mainHospital;
  final String distanceFromUser;
  final String doctorId;
  final int favouriteStatus;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: kCardColor,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadedScaleAnimation(
                    scaleDuration: const Duration(milliseconds: 400),
                    fadeDuration: const Duration(milliseconds: 400),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: FancyShimmerImage(
                          height: size.height * .14,
                          width: size.width * .19,
                          boxFit: BoxFit.contain,
                          errorWidget: const Image(
                            image: AssetImage("assets/icons/no image.png"),
                          ),
                          imageUrl: image),
                    ),
                  ),
                  const VerticalSpacingWidget(height: 2),
                  Text('Dr.\n$firstName\n$secondName', style: black14B600),
                ],
              ),
              const HorizontalSpacingWidget(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Specialisation In", style: grey11B400),
                  SizedBox(
                    width: size.width * .5,
                    child: Text(
                      specialization,
                      style: black12B500,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const VerticalSpacingWidget(height: 2),
                  Text("Location", style: grey11B400),
                  Text(location, style: black12B500),
                  const VerticalSpacingWidget(height: 2),
                  Text("Works at", style: grey11B400),
                  SizedBox(
                    height: size.height * .035,
                    width: size.width * .5,
                    child: Text(
                      mainHospital,
                      style: black12B500,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const VerticalSpacingWidget(height: 2),
                  distanceFromUser == 'null'
                      ? const SizedBox()
                      : Row(
                          children: [
                            Icon(
                              IconlyLight.location,
                              size: 14.sp,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            RichText(
                              text: TextSpan(
                                text: distanceFromUser,
                                style: black12B500,
                                children: [
                                  TextSpan(
                                      text: ' away',
                                      style: grey10B400,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {})
                                ],
                              ),
                            ),
                          ],
                        ),
                  const VerticalSpacingWidget(height: 5),
                  BlocBuilder<AddFavouritesBloc, AddFavouritesState>(
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          BlocProvider.of<AddFavouritesBloc>(context).add(
                            AddFavourites(
                                doctorId: doctorId,
                                favouriteStatus: favouriteStatus),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(width: 1.5.w, color: kMainColor),
                          ),
                          height: size.height * 0.04,
                          width: size.width * .44,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  state.favouriteStatusMap[doctorId] == false
                                      ? "Remove favourite"
                                      : "Add to favourite",
                                  style: main12B600),
                              const HorizontalSpacingWidget(width: 5),
                              Icon(
                                state.favouriteStatusMap[doctorId] == false
                                    ? CupertinoIcons.heart_fill
                                    : CupertinoIcons.heart,
                                color: kMainColor,
                                size: 16.sp,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
