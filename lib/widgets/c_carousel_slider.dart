import 'package:carousel_slider/carousel_slider.dart';
import 'package:drinkdash/constants/strings.dart';
import 'package:flutter/material.dart';

Widget cCaraouselSlider(double sW, double sH) {
  return CarouselSlider(
    items: [
      Image.asset(
        "$imagepath/c1.png",
        fit: BoxFit.fill,
      ),
      SizedBox(
          width: sW,
          height: sH * 0.4,
          child: Image.asset("$imagepath/c2.jpg", fit: BoxFit.fill)),
      SizedBox(
          width: sW,
          height: sH * 0.4,
          child: Image.asset("$imagepath/c3.jpg", fit: BoxFit.fill)),
      SizedBox(
          width: sW,
          height: sH * 0.4,
          child: Image.asset("$imagepath/c4.jpg", fit: BoxFit.fill)),
      SizedBox(
          width: sW,
          height: sH * 0.4,
          child: Image.asset("$imagepath/c5.jpeg", fit: BoxFit.fill))
    ],
    options: CarouselOptions(
        aspectRatio: 16 / 9,
        height: sH * 0.3,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        enlargeCenterPage: false,
        viewportFraction: 1,
        animateToClosest: true),
  );
}
