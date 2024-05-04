// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import 'package:share_plus/share_plus.dart';

class ViewFileScreen extends StatefulWidget {
  const ViewFileScreen({Key? key, required this.viewFile}) : super(key: key);

  final String viewFile;

  @override
  State<ViewFileScreen> createState() => _ViewFileScreenState();
}

class _ViewFileScreenState extends State<ViewFileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              shareImage();
            },
            icon: const Icon(IconlyLight.send),
          )
        ],
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FancyShimmerImage(
              height: 300.h,
              boxFit: BoxFit.fill,
              errorWidget: const Image(
                image: AssetImage("assets/icons/no image.png"),
              ),
              imageUrl: widget.viewFile),
        ),
      ),
    );
  }

  void shareImage() async {
    try {
      await Share.share(widget.viewFile, subject: 'Look what I made!');
    } catch (error) {
      GeneralServices.instance.showErrorMessage(context, error.toString());
    }
  }
}
