import 'package:flutter/widgets.dart';
import '../../../../CommonWidgets/horizontal_spacing_widget.dart';
import '../../../../CommonWidgets/text_style_widget.dart';

class VitalsRowTextWidget extends StatelessWidget {
  const VitalsRowTextWidget(
      {super.key, required this.heading, required this.data});

  final String heading;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$heading :", style: grey12B500),
        const HorizontalSpacingWidget(width: 4),
        Text(data, style: black13B500)
      ],
    );
  }
}
