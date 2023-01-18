import 'package:flutter/material.dart';

import '../../core/utils/color.dart';

class CustomTextForm extends StatelessWidget {
 final String text;
 final TextEditingController controller;
 final TextInputType inputType;

  const CustomTextForm({
    Key? key,
    required this.controller, required this.text, required this.inputType,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 1,
      textAlign: TextAlign.center,
      keyboardType: inputType,
      decoration:  InputDecoration(
          fillColor: secondaryBackgroundColor,
          filled: true,
          hintText: text,
          border: InputBorder.none),
    );
  }
}