import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/bottom_navigation_control_widget.dart';
import '../../../../Repository/Bloc/GetAppointment/GetCompletedAppointments/get_completed_appointments_bloc.dart';
import '../../../../ddd/application/rating/rating_bloc.dart';
import '../../../../ddd/application/rating_post/rating_post_bloc.dart';
import '../../../CommonWidgets/common_button_widget.dart';
import '../../../CommonWidgets/common_loadin_widget.dart';
import '../../../CommonWidgets/horizontal_spacing_widget.dart';
import '../../../CommonWidgets/text_style_widget.dart';
import '../../../CommonWidgets/vertical_spacing_widget.dart';
import '../../../Consts/app_colors.dart';
import '../../../Services/general_services.dart';

class RatingFormScreen extends StatefulWidget {
  const RatingFormScreen(
      {Key? key, required this.doctorName, required this.appointmentId})
      : super(key: key);

  final String doctorName;
  final int appointmentId;

  @override
  State<RatingFormScreen> createState() => _RatingFormScreenState();
}

class _RatingFormScreenState extends State<RatingFormScreen> {
  double? value;
  int? ratingId;
  int? reviewId;
  double? ratingValue;
  int? likedIndex;
  int? radioIndex;

  List radioItem = [
    "Less than 20 min",
    "20 min to 40 min",
    "40 min to 1 hr",
    "more then 1 hr",
  ];
  List likeItem = [
    {'name': 'Yes  ', 'Icon': Icons.thumb_up_alt_outlined},
    {'name': 'No  ', 'Icon': Icons.thumb_down_off_alt_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Dr ${widget.doctorName}."),
        centerTitle: true,
        leading: BlocBuilder<RatingBloc, RatingState>(
          builder: (context, state) {
            return BlocConsumer<RatingPostBloc, RatingPostState>(
              listener: (context, postState) {
                if (postState.isError) {
                  GeneralServices.instance
                      .showErrorMessage(context, postState.message);
                } else if (postState.status == true) {
                  GeneralServices.instance
                      .showToastMessage("Review added successfully");
                  BlocProvider.of<GetCompletedAppointmentsBloc>(context)
                      .add(FetchCompletedAppointments());
                  BlocProvider.of<RatingBloc>(context)
                      .add(const RatingEvent.ratingTextChanged(""));
                  BlocProvider.of<RatingBloc>(context)
                      .add(const RatingEvent.ratingReasonChanged(-1));
                  BlocProvider.of<RatingBloc>(context)
                      .add(const RatingEvent.ratingLikeChanged(-1));
                  BlocProvider.of<RatingBloc>(context)
                      .add(const RatingEvent.ratingRadioChanged(-1));
                  BlocProvider.of<RatingBloc>(context)
                      .add(const RatingEvent.ratingChanged(0));

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const BottomNavigationControlWidget(),
                      ));
                }
              },
              builder: (context, postState) {
                return IconButton(
                  onPressed: () {
                    log("appointment id = ${widget.appointmentId}");
                    log("rating value = ${state.ratingValue}");
                    log("selected review id = $reviewId");
                    log("liked index = ${state.likedIndex}");
                    log("radio index = ${state.radioIndex}");
                    log("rating id = $ratingId");
                    BlocProvider.of<RatingPostBloc>(context).add(
                      RatingPostEvent.ratingAddFeedBacks(
                        widget.appointmentId,
                        state.ratingValue,
                        reviewId,
                        state.likedIndex,
                        state.radioIndex,
                        ratingId,
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_back),
                );
              },
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<RatingBloc, RatingState>(
          builder: (context, state) {
            return Column(
              children: [
                starRating(state, context),
                const VerticalSpacingWidget(height: 5),
                Text(
                  state.ratingTest,
                  style: black16B600,
                ),
                const VerticalSpacingWidget(height: 5),
                const Divider(
                  thickness: 1,
                ),
                const VerticalSpacingWidget(height: 5),
                reason(size, state, context),
                const VerticalSpacingWidget(height: 5),
                const Divider(
                  thickness: 1,
                ),
                likeUnlike(size, state, context),
                const VerticalSpacingWidget(height: 5),
                const Divider(
                  thickness: 2,
                ),
                const VerticalSpacingWidget(height: 5),
                radioButtonWidget(size, state, context),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: BlocConsumer<RatingPostBloc, RatingPostState>(
                    listener: (context, postState) {
                      if (postState.isError) {
                        GeneralServices.instance
                            .showErrorMessage(context, postState.message);
                      } else if (postState.status == true) {
                        GeneralServices.instance
                            .showToastMessage("Review added successfully");
                        BlocProvider.of<GetCompletedAppointmentsBloc>(context)
                            .add(FetchCompletedAppointments());
                        BlocProvider.of<RatingBloc>(context)
                            .add(const RatingEvent.ratingTextChanged(""));
                        BlocProvider.of<RatingBloc>(context)
                            .add(const RatingEvent.ratingReasonChanged(-1));
                        BlocProvider.of<RatingBloc>(context)
                            .add(const RatingEvent.ratingLikeChanged(3));
                        BlocProvider.of<RatingBloc>(context)
                            .add(const RatingEvent.ratingRadioChanged(5));
                        BlocProvider.of<RatingBloc>(context)
                            .add(const RatingEvent.ratingChanged(0));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigationControlWidget(),
                            ));
                      }
                    },
                    builder: (context, postState) {
                      return CommonButtonWidget(
                          title: "Submit",
                          onTapFunction: () {
                            log("appointment id = ${widget.appointmentId}");
                            log("rating value = ${state.ratingValue}");
                            log("selected review id = $reviewId");
                            log("liked index = ${state.likedIndex}");
                            log("radio index = ${state.radioIndex}");
                            log("rating id = $ratingId");
                            BlocProvider.of<RatingPostBloc>(context).add(
                              RatingPostEvent.ratingAddFeedBacks(
                                widget.appointmentId,
                                state.ratingValue,
                                reviewId,
                                state.likedIndex,
                                state.radioIndex,
                                ratingId,
                              ),
                            );
                          });
                    },
                  ),
                ),
                const VerticalSpacingWidget(height: 15)
              ],
            );
          },
        ),
      ),
    );
  }

  RatingBar starRating(RatingState state, BuildContext context) {
    return RatingBar.builder(
        itemSize: 35.r,
        initialRating: state.ratingValue,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => Icon(
              Icons.star,
              color: kMainColor,
            ),
        onRatingUpdate: (rating) {
          value = rating;
          log(rating.toString());
          log("rating ui bulidre :  ${state.ratingValue}");
          if (rating == 0.5 || rating == 1) {
            BlocProvider.of<RatingBloc>(context)
                .add(const RatingEvent.ratingTextChanged("TERRIBLE"));
            BlocProvider.of<RatingBloc>(context)
                .add(const RatingEvent.ratingGetFeedBacks("TERRIBLE"));
            log("rating ui ${state.ratingTest}");
          } else if (rating == 1.5 || rating == 2) {
            BlocProvider.of<RatingBloc>(context)
                .add(const RatingEvent.ratingTextChanged("BAD"));
            BlocProvider.of<RatingBloc>(context)
                .add(const RatingEvent.ratingGetFeedBacks("BAD"));
            log("rating ui ${state.ratingTest}");
          } else if (rating == 2.5 || rating == 3) {
            BlocProvider.of<RatingBloc>(context)
                .add(const RatingEvent.ratingTextChanged("AVERAGE"));
            BlocProvider.of<RatingBloc>(context)
                .add(const RatingEvent.ratingGetFeedBacks("AVERAGE"));
            log("rating ui ${state.ratingTest}");
          } else if (rating == 3.5 || rating == 4) {
            BlocProvider.of<RatingBloc>(context)
                .add(const RatingEvent.ratingTextChanged("GREAT"));
            BlocProvider.of<RatingBloc>(context)
                .add(const RatingEvent.ratingGetFeedBacks("GREAT"));
            log("rating ui ${state.ratingTest}");
          } else if (rating == 4.5 || rating == 5) {
            BlocProvider.of<RatingBloc>(context)
                .add(const RatingEvent.ratingTextChanged("EXCELLENT"));
            BlocProvider.of<RatingBloc>(context)
                .add(const RatingEvent.ratingGetFeedBacks("EXCELLENT"));
            log("rating ui ${state.ratingTest}");
          }
          BlocProvider.of<RatingBloc>(context)
              .add(RatingEvent.ratingChanged(rating));
        });
  }

  Padding reason(Size size, RatingState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Sorry to hear to tell us what when wrong",
              style: black13B600,
            ),
          ),
          const VerticalSpacingWidget(height: 5),
          BlocBuilder<RatingBloc, RatingState>(
            builder: (context, state) {
              if (state.isloading) {
                return feedBackLoadingWidget();
              }
              if (state.isError) {
                return const Center(
                  child: Text("Something went wrong"),
                );
              }
              return Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: size.height * 0.01,
                spacing: size.width * 0.03,
                children: List.generate(
                  state.userRating.length,
                  (index) => GestureDetector(
                    onTap: () {
                      reviewId = state.userRating[index].reviewId;
                      ratingId = state.userRating[index].ratingId;
                      BlocProvider.of<RatingBloc>(context)
                          .add(RatingEvent.ratingReasonChanged(index));
                    },
                    child: Container(
                      height: size.height * 0.05,
                      width: size.width * 0.40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: state.reasonIndex == index
                              ? kMainColor
                              : kCardColor,
                          border: Border.all(color: kBorderColor)),
                      child: Center(
                          child: Text(
                        state.userRating[index].userComments.toString(),
                        style: state.reasonIndex == index
                            ? white13B500
                            : black13B500,
                      )),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Padding likeUnlike(Size size, RatingState state, BuildContext contex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Would you like to recommended the doctor",
            style: black13B600,
          ),
          const VerticalSpacingWidget(height: 10),
          Row(
            children: List.generate(
              2,
              (index) => GestureDetector(
                onTap: () {
                  BlocProvider.of<RatingBloc>(context)
                      .add(RatingEvent.ratingLikeChanged(index));
                },
                child: Padding(
                  padding: EdgeInsets.only(right: size.width * 0.03),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: kCardColor,
                        border: Border.all(color: kBorderColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          likeItem[index]['Icon'],
                          color: state.likedIndex == index
                              ? kMainColor
                              : kSubTextColor,
                          size: 18.sp,
                        ),
                        Text(
                          likeItem[index]['name'],
                          style: state.likedIndex == index
                              ? main12B600
                              : black12B600,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding radioButtonWidget(Size size, RatingState state, BuildContext contex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "How long did you wait to be seen by the doctor?",
            style: black13B600,
          ),
          const VerticalSpacingWidget(height: 10),
          SizedBox(
            height: size.height * 0.21,
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<RatingBloc>(context)
                              .add(RatingEvent.ratingRadioChanged(index));
                        },
                        child: Container(
                          height: 15,
                          width: 35,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: state.radioIndex == index
                                  ? kMainColor
                                  : kCardColor,
                              border: Border.all(color: kMainColor)),
                        ),
                      ),
                      const HorizontalSpacingWidget(width: 5),
                      Text(
                        radioItem[index],
                        style: state.radioIndex == index
                            ? main12B500
                            : black12B500,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) =>
                    const VerticalSpacingWidget(height: 15),
                itemCount: radioItem.length),
          )
        ],
      ),
    );
  }
}
