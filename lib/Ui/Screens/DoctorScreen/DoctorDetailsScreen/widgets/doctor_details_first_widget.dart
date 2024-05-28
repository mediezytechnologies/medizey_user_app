import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Repository/Bloc/Favourites/AddFavourites/add_favourites_bloc.dart';
import '../../../../CommonWidgets/horizontal_spacing_widget.dart';
import '../../../../Consts/text_style.dart';
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
      required this.doctorId,
      required this.favouriteStatus,
      required this.qualification});

  final String image;
  final String firstName;
  final String secondName;
  final String specialization;
  final String location;
  final String mainHospital;
  final String doctorId;
  final int favouriteStatus;
  final String qualification;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FadedScaleAnimation(
                scaleDuration: const Duration(milliseconds: 400),
                fadeDuration: const Duration(milliseconds: 400),
                child: Container(
                  height: size.width * .26,
                  width: size.width * .26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: Colors.grey.shade400,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: FancyShimmerImage(
                      height: size.height * .15,
                      width: size.width * .2,
                      boxFit: BoxFit.cover,
                      errorWidget: const Image(
                        image: AssetImage("assets/icons/no image.png"),
                      ),
                      imageUrl: image,
                    ),
                  ),
                ),
              ),
              const HorizontalSpacingWidget(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * .5,
                    child: Text(
                      'Dr $firstName $secondName',
                      style: black14B600,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const VerticalSpacingWidget(height: 2),
                  Text(specialization, style: black12B500),
                  const VerticalSpacingWidget(height: 2),
                  SizedBox(
                    width: size.width * .5,
                    child: Text(
                     qualification,
                      style: black12B500,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const VerticalSpacingWidget(height: 2),
                  SizedBox(
                    width: size.width * .5,
                    child: Text(
                      location,
                      style: black12B500,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: BlocBuilder<AddFavouritesBloc, AddFavouritesState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    BlocProvider.of<AddFavouritesBloc>(context).add(
                      AddFavourites(
                          doctorId: doctorId, favouriteStatus: favouriteStatus),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(width: 1.w, color: kMainColor),
                    ),
                    height: size.height * 0.035,
                    width: size.width * .42,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            state.favouriteStatusMap[doctorId] == false
                                ? "Remove from favourite"
                                : "Add to favourite",
                            style: main11B500),
                        const HorizontalSpacingWidget(width: 5),
                        Icon(
                          state.favouriteStatusMap[doctorId] == false
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          color: kMainColor,
                          size: 15.sp,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
