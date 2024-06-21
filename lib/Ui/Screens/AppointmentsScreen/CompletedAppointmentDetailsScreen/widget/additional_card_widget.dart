import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Consts/app_colors.dart';
import '../../../../Consts/text_style.dart';

class AdditionalCardWidget extends StatelessWidget {
  const AdditionalCardWidget({
    super.key,
    required this.size,
    required this.symptoms,
    required this.whenItsCome,
    required this.whenItStart,
  });

  final Size size;
  final String symptoms;
  final String whenItsCome;
  final String whenItStart;

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
          Row(
            children: [
              Text("Appointment for : ", style: grey12B500),
              SizedBox(
                width: size.width * .5,
                child: Text(symptoms,
                    style: black13B500,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
          Row(
            children: [
              Text("When did start : ", style: grey12B500),
              SizedBox(
                width: size.width * .5,
                child: Text(whenItsCome,
                    style: black13B500,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
          Row(
            children: [
              Text("Intensity : ", style: grey12B500),
              SizedBox(
                width: size.width * .5,
                child: Text(whenItStart,
                    style: black13B500,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ],
      ),
    );
  }
}