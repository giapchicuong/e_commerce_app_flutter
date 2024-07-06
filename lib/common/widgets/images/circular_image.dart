import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    required this.image,
    this.overlayColor,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
    this.isNetworkImage = false,
  });
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (THelperFunctions.isDarkMode(context)
                ? TColors.black
                : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
            image: isNetworkImage
                ? NetworkImage(image)
                : AssetImage(image) as ImageProvider,
            color: overlayColor),
      ),
    );
  }
}
