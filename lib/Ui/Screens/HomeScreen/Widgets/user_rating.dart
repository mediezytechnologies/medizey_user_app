// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import '../../../../ddd/application/rating/rating_bloc.dart';
import '../../../CommonWidgets/text_style_widget.dart';
import '../FeedbackScreen/feedback_screen.dart';

class UserRatingWidget extends StatelessWidget {
  const UserRatingWidget(
      {super.key, required this.doctorName, required this.appointmentId});

  final String doctorName;
  final int appointmentId;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.005),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r), color: kCardColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.stars,
              size: 40.sp,
              color: kMainColor,
            ),
            BlocBuilder<RatingBloc, RatingState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "How was your appointment experience \nwith Dr $doctorName?",
                      style: black13B500,
                    ),
                    RatingBar.builder(
                        itemSize: 25.r,
                        initialRating: state.ratingValue,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: kMainColor,
                            ),
                        onRatingUpdate: (rating) {
                          if (rating == 0.5 || rating == 1) {
                            BlocProvider.of<RatingBloc>(context).add(
                                const RatingEvent.ratingTextChanged(
                                    "TERRIBLE"));
                            BlocProvider.of<RatingBloc>(context).add(
                                const RatingEvent.ratingGetFeedBacks(
                                    "TERRIBLE"));
                          } else if (rating == 1.5 || rating == 2) {
                            BlocProvider.of<RatingBloc>(context).add(
                                const RatingEvent.ratingTextChanged("BAD"));
                            BlocProvider.of<RatingBloc>(context).add(
                                const RatingEvent.ratingGetFeedBacks("BAD"));
                          } else if (rating == 2.5 || rating == 3) {
                            BlocProvider.of<RatingBloc>(context).add(
                                const RatingEvent.ratingTextChanged("AVERAGE"));
                            BlocProvider.of<RatingBloc>(context).add(
                                const RatingEvent.ratingGetFeedBacks(
                                    "AVERAGE"));
                          } else if (rating == 3.5 || rating == 4) {
                            BlocProvider.of<RatingBloc>(context).add(
                                const RatingEvent.ratingTextChanged("GREAT"));
                            BlocProvider.of<RatingBloc>(context).add(
                                const RatingEvent.ratingGetFeedBacks("GREAT"));
                          } else if (rating == 4.5 || rating == 5) {
                            BlocProvider.of<RatingBloc>(context).add(
                                const RatingEvent.ratingTextChanged(
                                    "EXCELLENT"));
                            BlocProvider.of<RatingBloc>(context).add(
                                const RatingEvent.ratingGetFeedBacks(
                                    "EXCELLENT"));
                          }
                          BlocProvider.of<RatingBloc>(context)
                              .add(RatingEvent.ratingChanged(rating));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RatingFormScreen(
                                  doctorName: doctorName,
                                  appointmentId: appointmentId,
                                ),
                              ));
                        }),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
