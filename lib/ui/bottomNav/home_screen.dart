import 'package:drinkdash/constants/strings.dart';
import 'package:drinkdash/constants/theme_data.dart';
import 'package:drinkdash/data/productsList_data.dart';
import 'package:drinkdash/ui/bottomNav/item_list_screen/new_arrival_list_screen.dart';
import 'package:drinkdash/widgets/c_appbar.dart';
import 'package:drinkdash/widgets/c_banner.dart';
import 'package:drinkdash/widgets/c_carousel_slider.dart';
import 'package:drinkdash/widgets/hor_categories_list.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sW = MediaQuery.of(context).size.width;

    double sH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CBanner(),
            SizedBox(
                width: sW,
                // height: sH * 0.4,
                child: cCaraouselSlider(sW, sH)),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Hor_categories_list(sH: sH, sW: sW)),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Wrap(
                  spacing: sW * 0.05, // Space between containers horizontally
                  runSpacing: 20, // Space between containers vertically
                  children: List.generate(6, (index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the selected item's page
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => SelectedItemPage(label: containerLabels[index]),
                        //   ),
                        // );
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width *
                            0.4, // Adjust width to fit two in a row
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppTheme.primaryColor,
                        ),
                        child: Center(
                          child: Text(
                            brandsName[index], // Dynamically load label
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ))
          ],
        ),
      ),
    );
  }
}
