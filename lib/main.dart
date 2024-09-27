import 'package:drinkdash/constants/theme_data.dart';
import 'package:drinkdash/controller/cart_controller.dart';
import 'package:drinkdash/controller/homepage_controller.dart';
import 'package:drinkdash/ui/bottomNav/categories_screen.dart';
import 'package:drinkdash/ui/bottomNav/home_screen.dart';
import 'package:drinkdash/ui/bottomNav/item_list_screen/demo.dart';
import 'package:drinkdash/ui/bottomNav/item_list_screen/new_arrival_list_screen.dart';
import 'package:drinkdash/ui/bottomNav/order_screen.dart';
import 'package:drinkdash/ui/bottomNav/search_screen.dart';
import 'package:drinkdash/ui/ordering/product_review_screen.dart';
import 'package:drinkdash/widgets/c_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Drink Dash',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final BottomNavController _bottomNavController =
      Get.put(BottomNavController());

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    // const CategoriesScreen(),
     const SearchScreen(),
    SwipeableCards()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Obx(() {
          // Pass showBackIcon as true when currentIndex > 0 (for tabs 2, 3, 4)
          return CustomAppBar(
            showBackIcon: _bottomNavController.currentIndex.value != 0,
          );
        }),
      ),
      body: Obx(() => _screens[_bottomNavController.currentIndex.value]),
      drawer: Drawer(
        // Add Drawer to the Scaffold
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
              ),
              child: Text(
                'Drink Dash Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed, // Ensures labels are shown
            currentIndex: _bottomNavController.currentIndex.value,
            onTap: _bottomNavController.changeTabIndex,
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
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.greenAccent,
          child: Image.asset('assets/images/whatsapp.png'),
        ),
      ),
    );
  }
}
