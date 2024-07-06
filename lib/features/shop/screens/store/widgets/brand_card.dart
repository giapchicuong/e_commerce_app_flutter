import 'package:e_commerce_app/common/widgets/custome_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/images/circular_image.dart';
import 'package:e_commerce_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    this.showBorder = true,
    this.padding = TSizes.sm,
    this.backgroundColor = Colors.transparent,
    this.image = TImages.clothIcon,
    this.title = 'Nike',
    this.numberProduct = '256 products',
    this.onTap,
  });
  final bool showBorder;
  final double padding;
  final Color backgroundColor;
  final String image;
  final String title;
  final String numberProduct;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // Container Design
      child: TRoundedContainer(
        padding: EdgeInsets.all(padding),
        showBorder: showBorder,
        backgroundColor: backgroundColor,
        child: Row(
          children: [
            // Icon
            Flexible(
              child: CircularImage(
                isNetworkImage: false,
                image: image,
                backgroundColor: Colors.transparent,
                overlayColor: THelperFunctions.isDarkMode(context)
                    ? TColors.white
                    : TColors.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),

            // Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandTitleWithVerifiedIcon(
                    title: title,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    numberProduct,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
