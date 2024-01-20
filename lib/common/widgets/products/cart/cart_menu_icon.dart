import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/cart_controller.dart';
import '../../../../features/shop/screens/cart/cart.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

/// Custom widget for the cart counter icon
class KCartCounterIcon extends StatelessWidget {
  const KCartCounterIcon({
    super.key,
    this.iconColor, // Customize icon color
    this.counterBgColor, // Customize counter background color
    this.counterTextColor, // Customize counter text color
  });

  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    // Get an instance of the CartController
    final controller = Get.put(CartController());

    // Check if the app is in dark mode
    final dark = KHelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        // IconButton for navigating to the CartScreen
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Icon(Iconsax.shopping_bag, color: iconColor),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: KSizes.fontSizeLg,
            height: KSizes.fontSizeLg,
            decoration: BoxDecoration(
              color: counterBgColor ?? (dark ? KColors.white : KColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  controller.noOfCartItems.value.toString(),
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: counterTextColor ??
                            (dark ? KColors.black : KColors.white),
                        fontSizeFactor: 0.8,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}