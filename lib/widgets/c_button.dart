import 'package:drinkdash/constants/theme_data.dart';
import 'package:flutter/material.dart';

Widget cbutton(
  String label,
) {
  return InkWell(
    
    child: Container(
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 50,
      child: Center(
          child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      )),
    ),
  );
}
