import 'package:drinkdash/constants/theme_data.dart';
import 'package:drinkdash/controller/homepage_controller.dart';
import 'package:flutter/material.dart';

Widget cBottomNavBar(BottomNavController bottomNavController) {
  return BottomNavigationBar(
              type: BottomNavigationBarType.fixed, // Ensures labels are shown
              currentIndex: bottomNavController.currentIndex.value,
              onTap: bottomNavController.changeTabIndex,
              backgroundColor:
                  AppTheme.primaryColor, // Background color for the bar
              selectedItemColor: Colors.white, // Selected item color
              unselectedItemColor:
                  AppTheme.secondaryColor, // Unselected item color
              items: const [
                BottomNavigationBarItem(
                  label: "HOME",
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: "CATEGORIES",
                  icon: Icon(Icons.category),
                ),
                BottomNavigationBarItem(
                  label: "SEARCH",
                  icon: Icon(Icons.search),
                ),
                BottomNavigationBarItem(
                  label: "ORDERS",
                  icon: Icon(Icons.person),
                )
              ],
            );
}
