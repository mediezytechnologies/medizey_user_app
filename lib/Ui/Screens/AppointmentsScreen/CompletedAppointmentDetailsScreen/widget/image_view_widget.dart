import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ImageViewWidget extends StatelessWidget {
  const ImageViewWidget({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FancyShimmerImage(
              height: size.height * .7,
              boxFit: BoxFit.cover,
              errorWidget: const Image(
                image: AssetImage(
                  "assets/icons/no image.png",
                ),
              ),
              imageUrl: image),
        ),
      ),
    );
  }
}
