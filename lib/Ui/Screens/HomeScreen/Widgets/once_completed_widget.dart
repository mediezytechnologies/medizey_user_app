import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Model/GetAppointments/get_completed_appointments_model.dart';
import '../../../../ddd/application/rating/rating_bloc.dart';
import '../../../Consts/text_style.dart';
import '../../../CommonWidgets/vertical_spacing_widget.dart';
import '../../../Consts/app_colors.dart';
import '../../AppointmentsScreen/CompletedAppointmentDetailsScreen/completed_appointment_details_screen.dart';
import '../../../CommonWidgets/row_text_widget.dart';
import '../FeedbackScreen/feedback_screen.dart';

class OnceCompletedWidget extends StatelessWidget {
  const OnceCompletedWidget(
      {super.key,
      required this.doctorName,
      required this.doctorImage,
      required this.clinicName,
      required this.symptoms,
      required this.tokenDate,
      required this.tokenTime,
      required this.patientName,
      required this.note,
      required this.labTestName,
      required this.labName,
      required this.prescriptionImage,
      required this.prescriptions,
      required this.reviewAfter,
      required this.vitals,
      required this.scanningCenterName,
      required this.scanningTestName,
      required this.whenItStart,
      required this.whenItsCome,
      required this.checkInTime,
      required this.checkOutTime,
      required this.appointmentId});

  final String doctorName;
  final String doctorImage;
  final String clinicName;
  final String symptoms;
  final String tokenDate;
  final String tokenTime;
  final String patientName;
  final String note;
  final String labTestName;
  final String labName;
  final String prescriptionImage;
  final List<DoctorMedicines> prescriptions;
  final String reviewAfter;
  final List<Vitals> vitals;
  final String scanningCenterName;
  final String scanningTestName;
  final String whenItStart;
  final String whenItsCome;
  final String checkInTime;
  final String checkOutTime;
  final int appointmentId;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CompletedAppointmentDetailsScreen(
              prescriptions: prescriptions,
              clinicName: clinicName,
              doctorImage: doctorImage,
              doctorName: doctorName,
              labName: labName,
              labTestName: labTestName,
              note: note,
              patientName: patientName,
              prescriptionImage: prescriptionImage,
              symptoms: symptoms,
              tokenDate: tokenDate,
              tokenTime: tokenTime,
              reviewAfter: reviewAfter,
              vitals: vitals,
              scanningCenterName: scanningCenterName,
              scanningTestName: scanningTestName,
              whenItStart: whenItStart,
              whenItsCome: whenItsCome,
            ),
          ),
        );
      },
      child: Container(
        padding:
            EdgeInsets.only(top: 8.0.h, bottom: 5.0.h, left: 8.w, right: 10.w),
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadedScaleAnimation(
                  scaleDuration: const Duration(milliseconds: 400),
                  fadeDuration: const Duration(milliseconds: 400),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FancyShimmerImage(
                        height: size.height * .12,
                        width: size.width * .2,
                        boxFit: BoxFit.contain,
                        errorWidget: const Image(
                          image: AssetImage("assets/icons/no data.png"),
                        ),
                        imageUrl: doctorImage),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * .65,
                        child: Text(
                          "Dr $doctorName",
                          style: black14B600,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: size.width * .68,
                        child: Text(clinicName,
                            style: grey12B500,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                      SizedBox(
                        width: size.width * .68,
                        child: Text("$patientName for $symptoms",
                            style: grey12B500,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                      SizedBox(
                        width: size.width * .68,
                        child: Row(
                          children: [
                            Text("$tokenDate | ", style: black12B500),
                            Text(tokenTime,
                                style: black12B500,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * .68,
                        child: Row(
                          children: [
                            Text("check in & check out: ", style: grey12B500),
                            Text("$checkInTime & $checkOutTime",
                                style: black12B500,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            labTestName == "null"
                ? const SizedBox()
                : scanningTestName == "null"
                    ? const SizedBox()
                    : RowTextWidget(heading: "Lab test", data: labTestName),
            const VerticalSpacingWidget(height: 2),
            scanningCenterName == "null"
                ? const SizedBox()
                : scanningTestName == "null"
                    ? const SizedBox()
                    : RowTextWidget(
                        heading: "Scan test", data: scanningCenterName),
            const VerticalSpacingWidget(height: 2),
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: prescriptions.length > 1 ? 1 : prescriptions.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: size.height * .05,
                    child: Row(
                      children: [
                        Text("Medicines : ", style: grey12B500),
                        Text(
                          "${prescriptions[index].medicineName.toString()} ...",
                          style: black13B500,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                }),
            Divider(color: kSubTextColor, thickness: .5),
            Row(
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
                          "How was your appointment experience \nwith Dr $doctorName",
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
                                    const RatingEvent.ratingGetFeedBacks(
                                        "BAD"));
                              } else if (rating == 2.5 || rating == 3) {
                                BlocProvider.of<RatingBloc>(context).add(
                                    const RatingEvent.ratingTextChanged(
                                        "AVERAGE"));
                                BlocProvider.of<RatingBloc>(context).add(
                                    const RatingEvent.ratingGetFeedBacks(
                                        "AVERAGE"));
                              } else if (rating == 3.5 || rating == 4) {
                                BlocProvider.of<RatingBloc>(context).add(
                                    const RatingEvent.ratingTextChanged(
                                        "GREAT"));
                                BlocProvider.of<RatingBloc>(context).add(
                                    const RatingEvent.ratingGetFeedBacks(
                                        "GREAT"));
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
          ],
        ),
      ),
    );
  }
}
