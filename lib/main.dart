import 'package:drinkdash/constants/theme_data.dart';
import 'package:drinkdash/controller/cart_controller.dart';
import 'package:drinkdash/controller/homepage_controller.dart';
import 'package:drinkdash/ui/auth/login_screen.dart';
import 'package:drinkdash/ui/bottomNav/categories_screen.dart';
import 'package:drinkdash/ui/bottomNav/home_screen.dart';
import 'package:drinkdash/ui/bottomNav/item_list_screen/demo.dart';
import 'package:drinkdash/ui/bottomNav/item_list_screen/new_arrival_list_screen.dart';
import 'package:drinkdash/ui/bottomNav/order_screen.dart';
import 'package:drinkdash/ui/bottomNav/search_screen.dart';
import 'package:drinkdash/ui/ordering/edit_address_screen.dart';
import 'package:drinkdash/ui/ordering/emptcart_screen.dart';
import 'package:drinkdash/ui/ordering/cart_screen.dart';
import 'package:drinkdash/widgets/c_appbar.dart';
import 'package:drinkdash/widgets/c_bottom_nav_bar.dart';
import 'package:drinkdash/widgets/c_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures all bindings are initialized before using Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // This line comes from firebase_options.dart generated by FlutterFire CLI
  );

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

  final CartController cartController = Get.put(CartController());

  final List<Widget> _screens = [
    NewArrivalListScreen(),
    // const HomeScreen(),

    // EditAddressScreen(),
    // const CategoriesScreen(),
    NewArrivalListScreen(),
    const SearchScreen(),
    // SwipeableCards()
    // LogInScreen()
    EmptyCartScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Obx(() {
            return CustomAppBar(
              showBackIcon: _bottomNavController.currentIndex.value != 0,
            );
          }),
        ),
        body: Obx(() => _screens[_bottomNavController.currentIndex.value]),
        drawer: cDrawer(),
        bottomNavigationBar: Obx(() => cBottomNavBar(_bottomNavController)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.greenAccent,
            child: Image.asset('assets/images/whatsapp.png'),
          ),
        ),
      ),
    );
  }
}
