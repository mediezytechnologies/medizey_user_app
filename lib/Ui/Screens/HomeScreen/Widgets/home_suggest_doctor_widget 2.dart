import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Repository/Bloc/Suggestion/suggestion_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';

class HomeSuggestDoctorWidget extends StatelessWidget {
  const HomeSuggestDoctorWidget({
    super.key,
    required this.suggestionController,
  });

  final TextEditingController suggestionController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
          image: AssetImage("assets/images/suggestion.jpg"),
          fit: BoxFit.fill,
        ),
        Positioned(
          left: 10.w,
          top: 75.h,
          child: SizedBox(
            width: 220.w,
            height: 300.h,
            child: TextFormField(
              maxLines: 3,
              cursorColor: kMainColor,
              controller: suggestionController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                    fontSize: 13.sp, color: kSubTextColor),
                hintText: "Describe your experience",
                filled: true,
                fillColor: kCardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 10.w,
          top: 185.h,
          child: Row(
            children: [
              Text(
                "We really appreciate\n your feedback",
                style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const HorizontalSpacingWidget(width: 40),
              InkWell(
                onTap: () {
                  BlocProvider.of<SuggestionBloc>(context).add(
                    FetchSuggestions(
                        message: suggestionController.text),
                  );
                  suggestionController.clear();
                },
                child: Container(
                  height: 30.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: kMainColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}