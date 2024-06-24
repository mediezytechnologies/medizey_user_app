import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Consts/app_colors.dart';
import '../../../Consts/text_style.dart';

class RowTextWidget extends StatelessWidget {
  const RowTextWidget({super.key, required this.heading, required this.data});

  final String heading;
  final String data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Text("$heading : ", style: grey12B500),
          SizedBox(
            width: size.width * .5,
            child: Text(data,
                style: black13B500,
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
