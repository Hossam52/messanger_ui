import 'package:flutter/material.dart';

class SocialLabelText extends StatelessWidget {
  const SocialLabelText(
      {Key? key,
      required this.label,
      this.fontSize = 48,
      this.fontWeight = FontWeight.bold})
      : super(key: key);
  final String label;
  final double fontSize;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight));
  }
}
