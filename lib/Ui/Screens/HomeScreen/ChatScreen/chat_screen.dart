import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';

import '../../../Consts/text_style.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat bot", style: black15B600),
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
