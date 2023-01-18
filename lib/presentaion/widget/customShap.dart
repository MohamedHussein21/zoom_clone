import 'package:flutter/material.dart';
import 'package:zoom_clone/core/utils/color.dart';

class CustomButtonShap extends StatelessWidget {
  final String text;
  final IconData icon;
  final GestureTapCallback ontap;
  final Color color = buttonColor;
  const CustomButtonShap({
    Key? key,
    required this.height, required this.text, required this.icon, required this.ontap,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              size: 30,
            ),
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Text(text)
        ],
      ),
    );
  }
}