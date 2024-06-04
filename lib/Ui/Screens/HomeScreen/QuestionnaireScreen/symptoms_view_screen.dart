import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/QuestionnaireScreen/report_symptoms_screen.dart';

class SymptomsViewScreen extends StatefulWidget {
  const SymptomsViewScreen({super.key, required this.symptomId, required this.symptomName});

  final String symptomId;
  final String symptomName;

  @override
  State<SymptomsViewScreen> createState() => _SymptomsViewScreenState();
}

class _SymptomsViewScreenState extends State<SymptomsViewScreen> {
  int _selectedValue = 1;

  void _handleRadioValueChanged(int? value) {
    if (value != null) {
      setState(() {
        _selectedValue = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
          backgroundColor: kMainColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            const VerticalSpacingWidget(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "GENETICS",
                      style: TextStyle(
                          color: kMainColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "72% Indian men suffer from hair loss due to genetic predisposition of DHT hormone.",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Container(
                      height: 5.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Row(
                      children: [
                        Text(
                          "Do You have a family \nhistory of hair loss?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.sp),
                        ),
                        const HorizontalSpacingWidget(width: 30),
                        Image(
                            height: 80.h,
                            image:
                                const AssetImage("assets/icons/crystal 1.png"))
                      ],
                    ),
                    const VerticalSpacingWidget(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kCardColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: RadioListTile(
                        title: const Text('None'),
                        value: 1,
                        groupValue: _selectedValue,
                        onChanged: _handleRadioValueChanged,
                      ),
                    ),
                    const VerticalSpacingWidget(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kCardColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: RadioListTile(
                        title: const Text(
                            'Mother or anyone from mother’s side of the family '),
                        value: 2,
                        groupValue: _selectedValue,
                        onChanged: _handleRadioValueChanged,
                      ),
                    ),
                    const VerticalSpacingWidget(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kCardColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: RadioListTile(
                        title: const Text(
                            'Father or anyone from mother’s side of the family '),
                        value: 3,
                        groupValue: _selectedValue,
                        onChanged: _handleRadioValueChanged,
                      ),
                    ),
                    const VerticalSpacingWidget(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kCardColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: RadioListTile(
                        title: const Text('Both '),
                        value: 4,
                        groupValue: _selectedValue,
                        onChanged: _handleRadioValueChanged,
                      ),
                    ),
                    const VerticalSpacingWidget(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ReportSymptomsScreen()));
                      },
                      child: Center(
                        child: Container(
                          height: 40.h,
                          width: 154.w,
                          decoration: BoxDecoration(
                            color: kMainColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                              child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
