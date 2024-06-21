import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../CommonWidgets/vertical_spacing_widget.dart';
import '../../../../Consts/app_colors.dart';
import '../../../../Consts/text_style.dart';

class ReviewAfterAndNoteWidget extends StatelessWidget {
  const ReviewAfterAndNoteWidget({
    super.key,
    required this.reviewAfter,
    required this.note,
  });

  final String reviewAfter;

  final String note;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          reviewAfter == "null"
              ? Container()
              : Row(
                  children: [
                    Text("Review after : ", style: grey12B500),
                    SizedBox(
                      width: size.width * .5,
                      child: Text("$reviewAfter days",
                          style: black13B500,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
          note == "null"
              ? Container()
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Additional notes : ", style: grey12B500),
                    const VerticalSpacingWidget(height: 2),
                    Expanded(
                      child: Text(note, style: black13B500),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
