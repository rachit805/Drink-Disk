import 'package:drinkdash/constants/strings.dart';
import 'package:drinkdash/constants/theme_data.dart';
import 'package:drinkdash/data/productsList_data.dart';
import 'package:drinkdash/ui/bottomNav/item_list_screen/new_arrival_list_screen.dart';
import 'package:drinkdash/widgets/c_appbar.dart';
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
        child: Container(
          child: Column(
            children: [
              const CBanner(),
              SizedBox(
                width: sW,
                // height: sH * 0.4,
                child: CarouselSlider(
                  items: [
                    Image.asset(
                      "$imagepath/c1.png",
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                        width: sW,
                        height: sH * 0.4,
                        child:
                            Image.asset("$imagepath/c2.jpg", fit: BoxFit.fill)),
                    SizedBox(
                        width: sW,
                        height: sH * 0.4,
                        child:
                            Image.asset("$imagepath/c3.jpg", fit: BoxFit.fill)),
                    SizedBox(
                        width: sW,
                        height: sH * 0.4,
                        child:
                            Image.asset("$imagepath/c4.jpg", fit: BoxFit.fill)),
                    SizedBox(
                        width: sW,
                        height: sH * 0.4,
                        child:
                            Image.asset("$imagepath/c5.jpeg", fit: BoxFit.fill))
                  ],
                  options: CarouselOptions(
                      aspectRatio: 16 / 9,
                      height: sH * 0.3,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2),
                      enlargeCenterPage: false,
                      viewportFraction: 1,
                      animateToClosest: true),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                      height: sH * 0.22,
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
                                        imagePaths[
                                            index], // Dynamically load image
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
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ))),
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
                              0.42, // Adjust width to fit two in a row
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
      ),
    );
  }
}

class CBanner extends StatelessWidget {
  const CBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppTheme.secondaryColor),
      height: 60,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Text(
            "${bannertext}${banneno}",
            textAlign: TextAlign.center,
            style: AppTheme.textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
