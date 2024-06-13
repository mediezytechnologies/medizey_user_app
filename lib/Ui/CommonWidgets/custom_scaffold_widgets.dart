import 'package:flutter/material.dart';

import '../Consts/app_colors.dart';

class ContainerScaffold extends StatelessWidget {
  const ContainerScaffold({
    Key? key,
    required this.widget,
  }) : super(key: key);
final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
          color:kSecondaryColor,
          child: SafeArea(child: widget
          ,));
  }
}
