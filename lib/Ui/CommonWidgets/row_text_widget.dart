import 'package:flutter/material.dart';
import 'text_style_widget.dart';

class RowTextWidget extends StatelessWidget {
  const RowTextWidget({super.key, required this.heading, required this.data});

  final String heading;
  final String data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Text("$heading : ", style: grey12B500),
        SizedBox(
          width: size.width * .5,
          child: Text(data,
              style: black13B500, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}