import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_flutter/models/header_icon_model.dart';
import 'package:task_flutter/models/user_model.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key, required this.icons, required this.headerTitle})
      : super(key: key);
  final String headerTitle;
  final List<HeaderIconModel> icons;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(headerTitle,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        leading: CircleAvatar(
          backgroundImage: AssetImage(
              userImages[Random.secure().nextInt(userImages.length)]),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        trailing: _buildHeaderButtons());
  }

  Widget _buildHeaderButtons() {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: icons
            .map(
              (e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildIconButton(e.icon, e.onPressed),
              ),
            )
            .toList());
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade700,
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: Colors.white),
          color: Colors.green),
    );
  }
}
