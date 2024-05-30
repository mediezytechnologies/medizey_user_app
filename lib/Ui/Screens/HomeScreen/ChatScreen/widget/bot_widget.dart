import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import '../../../../CommonWidgets/horizontal_spacing_widget.dart';
import '../../../../CommonWidgets/vertical_spacing_widget.dart';
import '../../../../Consts/app_colors.dart';
import '../../../../Consts/text_style.dart';

class BotWidget extends StatelessWidget {
  const BotWidget({
    super.key,
    required this.text,
    required this.isUsefull,
    required this.onPressed,
  });

  final String text;
  final bool isUsefull;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: size.width * .11,
          width: size.width * .11,
          decoration: BoxDecoration(
            color: kMainColor,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: const AssetImage("assets/icons/mediezyIcon.png"),
                color: kCardColor,
              ),
            ),
          ),
        ),
        const HorizontalSpacingWidget(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kCardColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                width: size.width * 0.7,
                decoration: BoxDecoration(
                  color: kMainColor,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: kBorderColor),
                ),
                child: Center(
                  child: Text(text, style: white13B500),
                ),
              ),
            ),
            const VerticalSpacingWidget(height: 3),
            isUsefull
                ? Row(
                    children: [
                      Text(
                        "Information is usefull? ",
                        style: grey13B400,
                      ),
                      const HorizontalSpacingWidget(width: 40),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              GeneralServices.instance.showToastMessage(
                                  "Thank you for your response");
                            },
                            child: Text(
                              "Yes",
                              style: main13B500,
                            ),
                          ),
                          const HorizontalSpacingWidget(width: 20),
                          GestureDetector(
                            onTap: onPressed,
                            child: Text("No", style: main13B500),
                          )
                        ],
                      )
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ],
    );
  }
}
