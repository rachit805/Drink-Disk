import 'package:drinkdash/constants/theme_data.dart';
import 'package:drinkdash/widgets/c_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:drinkdash/ui/constants/theme_data.dart'; // Assuming AppTheme is defined here

class CustomAppBar extends StatelessWidget {
  final bool showBackIcon;

  const CustomAppBar({
    Key? key,
    this.showBackIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0, // Set the height of the AppBar
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
                .displayLarge
                ?.copyWith(color: Colors.white),
          ),
          // Right side - Two icons
          const Row(
            children: [
              CIcon(icon: Icons.search),
              SizedBox(width: 16), // Spacing between icons
              CIcon(icon: Icons.shopping_cart),
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
        size: 35, // Icon size
        color: AppTheme.secondaryColor, // Icon color
      ),
    );
  }
}
