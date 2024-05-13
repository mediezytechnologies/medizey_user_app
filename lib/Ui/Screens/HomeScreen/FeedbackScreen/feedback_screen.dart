import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../ddd/application/rating/rating_bloc.dart';
import '../../../CommonWidgets/common_button_widget.dart';
import '../../../CommonWidgets/horizontal_spacing_widget.dart';
import '../../../CommonWidgets/text_style_widget.dart';
import '../../../CommonWidgets/vertical_spacing_widget.dart';
import '../../../Consts/app_colors.dart';

class RatingFormScreen extends StatefulWidget {
  const RatingFormScreen(
      {Key? key, required this.doctorName, required this.appointmentId})
      : super(key: key);

  final String doctorName;
  final String appointmentId;

  @override
  State<RatingFormScreen> createState() => _RatingFormScreenState();
}

class _RatingFormScreenState extends State<RatingFormScreen> {
  double? value;
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

  List textReson = [
    "Doctor Not Friendly",
    "Explanation of Issue",
    "High Wait Time",
    "Unhelpfull Staff",
    "Charged Higher Fee",
    "Incorect Location",
    "Doctor Unavailable",
    "Other"
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Dr ${widget.doctorName}."),
        centerTitle: true,
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
                  style: black14B600,
                ),
                const VerticalSpacingWidget(height: 5),
                const Divider(
                  thickness: 2,
                ),
                const VerticalSpacingWidget(height: 5),
                reason(size, state, context),
                const VerticalSpacingWidget(height: 10),
                const Divider(
                  thickness: 2,
                ),
                likeUnlike(size, state, context),
                const VerticalSpacingWidget(height: 10),
                const Divider(
                  thickness: 2,
                ),
                const VerticalSpacingWidget(height: 10),
                radioButtonWidget(size, state, context),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child:
                      CommonButtonWidget(title: "Submit", onTapFunction: () {}),
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
        itemSize: 27.r,
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

  Column reason(Size size, RatingState state, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sorry to hear to Tell us what when wrong",
          style: black14B600,
        ),
        const VerticalSpacingWidget(height: 5),
        BlocBuilder<RatingBloc, RatingState>(
          builder: (context, state) {
            if (state.isloading) {
              return SizedBox(
                height: size.height * .3,
                child: Center(
                  child: CircularProgressIndicator(
                    color: kMainColor,
                  ),
                ),
              );
            }
            if (state.isError) {
              return const Center(
                child: Text("Something went wrong"),
              );
            }
            return Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: size.height * 0.02,
              spacing: size.width * 0.02,
              children: List.generate(
                state.userRating.length,
                (index) => GestureDetector(
                  onTap: () {
                    BlocProvider.of<RatingBloc>(context)
                        .add(RatingEvent.ratingReasonChanged(index));
                  },
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * 0.47,
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
                          ? white14B500
                          : black14B500,
                    )),
                  ),
                ),
              ),
            );
          },
        ),
      ],
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
            style: black14B600,
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
                          height: 20,
                          width: 40,
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
                        style:
                            state.radioIndex == index ? main4B500 : black14B500,
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

  //like button=================================

  Padding likeUnlike(Size size, RatingState state, BuildContext contex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Would you like to recommended the doctor",
            style: black14B600,
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
                    height: size.height * 0.06,
                    width: size.width * 0.2,
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
                        ),
                        Text(
                          likeItem[index]['name'],
                          style: state.likedIndex == index
                              ? main4B500
                              : black14B500,
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

//reson=================================
}
