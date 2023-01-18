import 'package:flutter/material.dart';

import '../../core/utils/color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onprees ;
  const CustomButton({
    Key? key, required this.text, required this.onprees,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onprees,
      color: buttonColor,
      minWidth: 200,
      height: 40,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      child:   Text(text,style: const TextStyle(fontSize: 17),),
    );
  }
}