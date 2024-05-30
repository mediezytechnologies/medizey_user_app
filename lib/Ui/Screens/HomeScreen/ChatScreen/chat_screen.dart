import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Repository/Bloc/Chat/chat_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import '../../../CommonWidgets/common_loadin_widget.dart';
import '../../../Consts/text_style.dart';
import 'widget/bot_widget.dart';
import 'widget/user_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<QuestionsModel> questions = [
    QuestionsModel(id: 0, questions: "Token booking"),
    QuestionsModel(id: 1, questions: "Payment"),
    QuestionsModel(id: 2, questions: "Health record"),
    QuestionsModel(id: 3, questions: "Estimate time"),
    QuestionsModel(id: 4, questions: "Update profile"),
    QuestionsModel(id: 5, questions: "Other"),
  ];
  final TextEditingController messageController = TextEditingController();
  final FocusNode messageFocus = FocusNode();

  int questionIndex = -1;
  int? selectedQuestionId;
  String selectedQuestion = '';
  String questionAnswer = '';
  bool isUserChatLoading = false;
  bool isBotChatLoading = false;
  String message = '';

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
      selectedQuestionId = questions[index].id;
      questionAnswer = '';
    });

    log("Selected question id >>>>>> $selectedQuestionId");

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isUserChatLoading = false;
        selectedQuestionId == 5
            ? isBotChatLoading = false
            : isBotChatLoading = true;
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
        return "Steps to follow\n1 Select doctor\n2 Select clinic\n3 Select token\n4 Check token time\n5 Fill neccesary details\n6.Process payment";
      case 1:
        return "Steps to follow\n1 Select payment method\n2 Secure payment input\n3 Confirmation and receipt";
      case 2:
        return "Steps to follow\n1 Access upload option\n2 Select Files\n3 Review and Add Details\n4 Secure Upload and Progress\n5 Confirmation and Access";
      case 3:
        return "Utilize our app's main feature to estimate your arrival time at the clinic accurately and also identify which token is currently being consulted by the doctor, streamlining your visit";
      case 4:
        return "Easily update your profile details, including images and personal information, for a personalized experience tailored to your needs";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      body: BlocListener<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state is ChatLoaded) {
            GeneralServices.instance.showToastMessage(
              state.chatModel.message.toString(),
            );
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.pop(context);
            });
          }
          if (state is ChatError) {
            GeneralServices.instance.showToastMessage(state.errorMessage);
          }
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BotWidget(
                      text:
                          "Hello! Welcome to Mediezy.\nHow can I assist you today?",
                      isUsefull: false,
                      onPressed: () {},
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
                                      style:
                                          questions[index].id == questionIndex
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
                    selectedQuestion == '' || selectedQuestionId == 5
                        ? const SizedBox()
                        : (isUserChatLoading)
                            ? chatUserLoadingWidget()
                            : UserWidget(text: selectedQuestion),
                    questionAnswer == '' && !isBotChatLoading
                        ? const SizedBox()
                        : (isBotChatLoading)
                            ? chatBotLoadingWidget()
                            : Column(
                                children: [
                                  const VerticalSpacingWidget(height: 10),
                                  BotWidget(
                                    text: questionAnswer,
                                    isUsefull: true,
                                    onPressed: () {
                                      setState(() {
                                        selectedQuestionId = 5;
                                      });
                                    },
                                  ),
                                  const VerticalSpacingWidget(height: 10),
                                ],
                              ),
                    selectedQuestionId != 5
                        ? const SizedBox()
                        : Column(
                            children: [
                              BotWidget(
                                text: "Enter your message below",
                                isUsefull: false,
                                onPressed: () {},
                              ),
                              message == ''
                                  ? const VerticalSpacingWidget(height: 60)
                                  : const VerticalSpacingWidget(height: 0)
                            ],
                          ),
                    message == ''
                        ? const SizedBox()
                        : Column(
                            children: [
                              const VerticalSpacingWidget(height: 10),
                              UserWidget(text: messageController.text),
                              const VerticalSpacingWidget(height: 10),
                            ],
                          ),
                    const VerticalSpacingWidget(height: 60)
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
                        focusNode: messageFocus,
                        enabled: selectedQuestionId == 5 ? true : false,
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
                        color: selectedQuestionId == 5
                            ? kMainColor
                            : kSubTextColor,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: GestureDetector(
                        onTap: selectedQuestionId == 5
                            ? () {
                                if (messageController.text.isEmpty) {
                                  GeneralServices.instance
                                      .showToastMessage("Enter message");
                                } else {
                                  BlocProvider.of<ChatBloc>(context).add(
                                    AddChatEvent(
                                        message: messageController.text),
                                  );
                                  setState(() {
                                    message = messageController.text;
                                    messageFocus.unfocus();
                                  });
                                }
                              }
                            : () {},
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
      ),
    );
  }
}

class QuestionsModel {
  int id;
  final String questions;

  QuestionsModel({required this.id, required this.questions});
}
