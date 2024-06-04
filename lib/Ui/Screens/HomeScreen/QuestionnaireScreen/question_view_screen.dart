import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/bottom_navigation_control_widget.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import '../../../../ddd/application/questionare/get_questions/get_questions_bloc.dart';
import '../../../../ddd/application/questionare/submit_answer/submit_answer_bloc.dart';
import '../../../CommonWidgets/vertical_spacing_widget.dart';
import '../../../Consts/app_colors.dart';
import '../../../Consts/text_style.dart';

class QuestionViewScreen extends StatefulWidget {
  const QuestionViewScreen(
      {super.key, required this.symptomId, required this.symptomName});

  final String symptomId;
  final String symptomName;

  @override
  State<QuestionViewScreen> createState() => _QuestionViewScreenState();
}

class _QuestionViewScreenState extends State<QuestionViewScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;
  int _selectedValue = -1;
  String? selectedAnswer;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetQuestionsBloc>(context).add(
      GetQuestionsEvent.getQuestions(widget.symptomId),
    );
  }

  @override
  Widget build(BuildContext context) {
    log("passed symptom id >>> ${widget.symptomId}");
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<GetQuestionsBloc, GetQuestionsState>(
        builder: (context, state) {
          if (state.isloding) {
            return SizedBox(
              child: Center(
                child: CircularProgressIndicator(color: kMainColor),
              ),
            );
          }
          if (state.isError) {
            return Center(
              child: Text(
                state.message.toString(),
              ),
            );
          }
          return Stack(
            children: [
              PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.model.length,
                controller: pageController,
                onPageChanged: (newIndex) {
                  setState(() {
                    currentPageIndex = newIndex;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const VerticalSpacingWidget(height: 50),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: kMainColor),
                        child: Column(
                          children: [
                            Text(
                              '${state.model[index].symptomQuestion}',
                              style: white14B500,
                            ),
                            const VerticalSpacingWidget(height: 5),
                            Divider(color: kCardColor, height: 2.h),
                            const VerticalSpacingWidget(height: 5),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.model[index].options!.length,
                                itemBuilder: (context, ind) {
                                  return Container(
                                    margin: const EdgeInsets.all(8),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: kCardColor,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: RadioListTile(
                                      activeColor: kMainColor,
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 4.w),
                                      title: Text(
                                        '${state.model[index].options?[ind].toString()}',
                                        style: black13B500,
                                      ),
                                      value: ind,
                                      groupValue: _selectedValue,
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedAnswer = state
                                              .model[index].options![ind]
                                              .toString();
                                          _selectedValue = newValue!;
                                        });
                                      },
                                    ),
                                  );
                                }),
                            const VerticalSpacingWidget(height: 5),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: kMainColor,
                                backgroundColor: kCardColor,
                                fixedSize: Size(120.w, 40.w),
                              ),
                              onPressed: () => handleAnswerSubmission(
                                  context, state, currentPageIndex),
                              child: const Text("Submit"),
                            ),
                            const VerticalSpacingWidget(height: 5),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              Positioned(
                left: 15.w,
                top: 15.h,
                child: Text(widget.symptomName, style: black16B600),
              ),
            ],
          );
        },
      ),
    );
  }

  void handleAnswerSubmission(
      BuildContext context, GetQuestionsState state, int currentIndex) {
    final submitBloc = BlocProvider.of<SubmitAnswerBloc>(context);
    submitBloc.add(
      SubmitAnswerEvent.started(
        state.model[currentIndex].id.toString(),
        selectedAnswer.toString(),
      ),
    );

    if (submitBloc.state.status != true) {
      if (currentIndex == state.model.length - 1) {
        GeneralServices.instance.showToastMessage(
            'Thank you for your time.\nWe will inform the doctor of your information');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BottomNavigationControlWidget(selectedIndex: 0),
          ),
        );
      } else {
        _selectedValue = -1;
        pageController.animateToPage(currentIndex + 1,
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
      }
    } else {
      _selectedValue = -1;
      pageController.animateToPage(currentIndex + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }
}
