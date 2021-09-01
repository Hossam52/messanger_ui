import 'package:flutter/material.dart';

class HeaderIconModel {
  IconData icon;
  VoidCallback onPressed;
  HeaderIconModel({
    required this.icon,
    required this.onPressed,
  });
}
