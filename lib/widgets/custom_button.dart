import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      this.backgroundColor = Colors.purple,
      this.textColor = Colors.white,
      required this.onPressed,
      this.borderRadius = 20})
      : super(key: key);
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(text, style: TextStyle()),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          foregroundColor: MaterialStateProperty.all(textColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius))),
          textStyle: MaterialStateProperty.all(
              TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
          padding: MaterialStateProperty.all(const EdgeInsets.all(10))),
    );
  }
}
