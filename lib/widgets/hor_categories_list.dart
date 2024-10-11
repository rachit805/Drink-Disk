import 'package:drinkdash/constants/theme_data.dart';
import 'package:drinkdash/data/productsList_data.dart';
import 'package:drinkdash/ui/bottomNav/item_list_screen/new_arrival_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Hor_categories_list extends StatelessWidget {
  const Hor_categories_list({
    super.key,
    required this.sH,
    required this.sW,
  });

  final double sH;
  final double sW;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: sH * 0.23,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: imagePaths
              .length, // Set item count to the length of the imagePaths list
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () {
                Get.to(() => NewArrivalListScreen());
              },
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                height: sH * 0.22,
                width: sW * 0.47,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppTheme.primaryColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: Image.asset(
                          imagePaths[index], // Dynamically load image
                          height: sH * 0.174,
                          width: sW * 0.47,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: Text(
                        labels[index],
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
