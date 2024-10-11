import 'package:flutter/material.dart';

class CTextformfield extends StatelessWidget {
  const CTextformfield({
    super.key,
    required this.hintname,
    required this.controller,
    this.keyboardType,
    this.onChanged,
  });
  final String hintname;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black.withOpacity(0.3),
          )),
          fillColor: Colors.white,
          hintText: hintname,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 13,
          )),
    );
  }
}
