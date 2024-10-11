import 'package:drinkdash/constants/theme_data.dart';
import 'package:drinkdash/controller/cart_controller.dart';
import 'package:drinkdash/ui/ordering/emptcart_screen.dart';
import 'package:drinkdash/ui/ordering/cart_screen.dart';
// import 'package:drinkdash/widgets/c_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final bool showBackIcon;

  CustomAppBar({
    Key? key,
    this.showBackIcon = false,
  }) : super(key: key);

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0, // Set the height of the AppBar
      color: AppTheme.primaryColor, // AppBar background color
      padding:
          const EdgeInsets.symmetric(horizontal: 16.0), // Padding for the icons
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Leading Icons - Back Arrow or Menu and Facebook/Menu
          Row(
            children: [
              // Display Back Arrow or Menu
              CIcon(
                icon: showBackIcon
                    ? Icons.arrow_back
                    : Icons.menu, // Show back arrow if not on Home tab
                onTap: () {
                  if (showBackIcon) {
                    if (Navigator.of(context).canPop()) {
                      Get.back(); // Only go back if the navigator can pop
                    }
                  } else {
                    Scaffold.of(context)
                        .openDrawer(); // Open Drawer when Menu is tapped
                  }
                },
              ),
              const SizedBox(width: 16),
              // Show Menu Icon when on other tabs (index > 0), Facebook Icon when on Home
              CIcon(
                icon: showBackIcon ? Icons.menu : Icons.facebook,
                onTap: () {
                  Scaffold.of(context)
                      .openDrawer(); // Open drawer when menu is tapped on non-home tabs
                },
              ),
            ],
          ),
          // Title in the center
          Text(
            "Drink Dash",
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Colors.white),
          ),
          // Right side - Two icons
          Row(
            children: [
              const CIcon(icon: Icons.search),
              const SizedBox(width: 16), // Spacing between icons
              InkWell(
                onTap: () {
                  // Check if cart is empty or not
                  if (cartController.quantity.value > 0) {
                    // Navigate to CartScreen if items are in the cart
                    Get.to(() => CartScreen());
                  } else {
                    // Navigate to EmptyCartScreen if the cart is empty
                    Get.to(() => const EmptyCartScreen());
                  }
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // The cart icon
                    const CIcon(icon: Icons.shopping_cart),

                    // Positioned widget for the quantity text
                    Obx(() {
                      // Conditionally render CircleAvatar based on quantity
                      return cartController.quantity.value > 0
                          ? Positioned(
                              right: 0,
                              top:
                                  0, // Adjust this value to move the quantity text upwards
                              child: CircleAvatar(
                                radius: 10, // Adjusted size for better fit
                                backgroundColor: Colors.redAccent,
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      2.0), // Optional padding for aesthetics
                                  child: Text(
                                    cartController.quantity.value.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          12, // Font size for quantity text
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(); // Return an empty widget when quantity is 0
                    }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const CIcon({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 30, // Icon size
        color: AppTheme.secondaryColor, // Icon color
      ),
    );
  }
}
