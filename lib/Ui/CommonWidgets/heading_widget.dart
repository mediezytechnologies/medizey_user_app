import 'package:flutter/material.dart';
import 'package:mediezy_user/Ui/Consts/text_style.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: grey15B500);
  }
}
