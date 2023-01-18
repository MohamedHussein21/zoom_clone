import 'package:flutter/material.dart';

import '../../core/utils/color.dart';

class JoinOption extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onChange;

  const JoinOption({
    Key? key,
    required this.text,
    required this.isMute,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      color: secondaryBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(text),
            const Spacer(),
            Switch(value: isMute, onChanged: onChange)
          ],
        ),
      ),
    );
  }
}