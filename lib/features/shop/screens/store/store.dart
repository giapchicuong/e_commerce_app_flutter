import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/appbar/tabbar.dart';
import 'package:e_commerce_app/common/widgets/custome_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/custome_shapes/containers/search_container.dart';
import 'package:e_commerce_app/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/screens/store/widgets/brand_card.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: TAppbar(
          title: const Text('Store'),
          actions: [
            CartCounterIcon(
              onPressed: () {},
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(
                    TSizes.defaultSpace,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // Search bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const SearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      // Featured Brands
                      SectionHeading(
                        title: 'Featured Brands',
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),

                      //Brands Grid
                      TGridLayout(
                        mainAxisExtent: 80,
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return const BrandCard(
                            showBorder: false,
                          );
                        },
                      )
                    ],
                  ),
                ),
                // Tabs
                bottom: const TTabBar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    // Tab(child: Text('Furniture')),
                    // Tab(child: Text('Electronics')),
                    // Tab(child: Text('Clothes')),
                    // Tab(child: Text('Cosmetics'))
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    // Brands
                    BrandShowcase()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          // Brand with Products Count
          const BrandCard(
            showBorder: false,
          ),
          // Brand top 3 product images
          Row(
            children: [
              Expanded(
                child: TRoundedContainer(
                  height: 100,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.primary
                      : TColors.light,
                  margin: const EdgeInsets.only(right: TSizes.sm),
                  padding: const EdgeInsets.all(TSizes.md),
                  child: const Image(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      TImages.productImage3,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TRoundedContainer(
                  height: 100,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.primary
                      : TColors.light,
                  margin: const EdgeInsets.only(right: TSizes.sm),
                  padding: const EdgeInsets.all(TSizes.md),
                  child: const Image(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      TImages.productImage3,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TRoundedContainer(
                  height: 100,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.primary
                      : TColors.light,
                  margin: const EdgeInsets.only(right: TSizes.sm),
                  padding: const EdgeInsets.all(TSizes.md),
                  child: const Image(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      TImages.productImage3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
