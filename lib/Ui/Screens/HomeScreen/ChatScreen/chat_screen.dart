import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import '../../../CommonWidgets/common_loadin_widget.dart';
import '../../../Consts/text_style.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();

  final List<QuestionsModel> questions = [
    QuestionsModel(id: 0, questions: "Hi"),
    QuestionsModel(id: 1, questions: "How are you"),
    QuestionsModel(id: 2, questions: "How old are you"),
    QuestionsModel(id: 3, questions: "Enthokke in vishesham"),
    QuestionsModel(id: 4, questions: "sugona mwone"),
  ];

  int questionIndex = -1;
  String selectedQuestion = '';
  String questionAnswer = '';
  bool isUserChatLoading = false;
  bool isBotChatLoading = false;

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }

  void handleQuestionTap(int index) {
    setState(() {
      isUserChatLoading = true;
      isBotChatLoading = false;
      questionIndex = index;
      selectedQuestion = questions[index].questions;
      questionAnswer = '';
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isUserChatLoading = false;
        isBotChatLoading = true;
      });

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          isBotChatLoading = false;
          questionAnswer = getAnswerForQuestion(index);
        });
      });
    });
  }

  String getAnswerForQuestion(int index) {
    switch (index) {
      case 0:
        return "Hello, how can I help you?";
      case 1:
        return "I am fine. How about you?";
      case 2:
        return "I am a chatbot, I don't have an age.";
      case 3:
        return "Sugam thankalko?";
      case 4:
        return "Pinne paramsugam mwone, ninako?";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Mediezy bot", style: black15B600),
        backgroundColor: kCardColor,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            height: size.height * .02,
            width: size.width * .02,
            child: Image.asset(
              "assets/icons/mediezyIcon.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            padding: const EdgeInsets.all(5.0),
                            child: Image(
                              image: const AssetImage(
                                  "assets/icons/mediezyIcon.png"),
                              color: kCardColor,
                            ),
                          ),
                        ),
                      ),
                      const HorizontalSpacingWidget(width: 8),
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
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          width: size.width * 0.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: kBorderColor),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 6.h),
                            child: Center(
                              child: Text(
                                  "Hello! Welcome to Mediezy.\nHow can I assist you today?",
                                  style: black13B500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacingWidget(height: 10),
                  Wrap(
                    alignment: WrapAlignment.start,
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
                            padding: const EdgeInsets.all(8),
                            child: Image(
                              image: const AssetImage(
                                  "assets/icons/mediezyIcon.png"),
                              color: kCardColor,
                            ),
                          ),
                        ),
                      ),
                      const HorizontalSpacingWidget(width: 8),
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
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runSpacing: size.height * 0.01,
                          spacing: size.width * 0.03,
                          children: List.generate(
                            questions.length,
                            (index) => GestureDetector(
                              onTap: () => handleQuestionTap(index),
                              child: Container(
                                height: size.height * 0.05,
                                width: size.width * 0.7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(color: kBorderColor),
                                  color: questions[index].id == questionIndex
                                      ? kMainColor
                                      : kCardColor,
                                ),
                                child: Center(
                                  child: Text(
                                    questions[index].questions,
                                    style: questions[index].id == questionIndex
                                        ? white13B500
                                        : black13B500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacingWidget(height: 10),
                  selectedQuestion == ''
                      ? const SizedBox()
                      : (isUserChatLoading)
                          ? chatUserLoadingWidget()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: kCardColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.r),
                                      bottomLeft: Radius.circular(10.r),
                                      bottomRight: Radius.circular(10.r),
                                    ),
                                  ),
                                  child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    width: size.width * 0.7,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(color: kBorderColor),
                                    ),
                                    child: Center(
                                      child: Text(selectedQuestion,
                                          style: black13B500),
                                    ),
                                  ),
                                ),
                                const HorizontalSpacingWidget(width: 8),
                                Container(
                                  height: size.width * .11,
                                  width: size.width * .11,
                                  decoration: BoxDecoration(
                                    color: kMainColor,
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Image(
                                        image: const AssetImage(
                                            "assets/icons/profile pic.png"),
                                        color: kCardColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                  const VerticalSpacingWidget(height: 10),
                  questionAnswer == '' && !isBotChatLoading
                      ? const SizedBox()
                      : (isBotChatLoading)
                          ? chatBotLoadingWidget()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                      padding: const EdgeInsets.all(5.0),
                                      child: Image(
                                        image: const AssetImage(
                                            "assets/icons/mediezyIcon.png"),
                                        color: kCardColor,
                                      ),
                                    ),
                                  ),
                                ),
                                const HorizontalSpacingWidget(width: 8),
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    width: size.width * 0.7,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(color: kBorderColor),
                                    ),
                                    child: Center(
                                      child: Text(questionAnswer,
                                          style: black13B500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.all(10),
              height: size.height * .08,
              width: double.infinity,
              color: kCardColor,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: black13B500,
                      controller: messageController,
                      decoration: InputDecoration(
                          hintStyle: grey13B600,
                          hintText: "Write message...",
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    height: size.width * .11,
                    width: size.width * .11,
                    decoration: BoxDecoration(
                      color: kMainColor,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Icon(
                          Icons.send,
                          color: kCardColor,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionsModel {
  int id;
  final String questions;

  QuestionsModel({required this.id, required this.questions});
}
