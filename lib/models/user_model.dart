import 'dart:math';

import 'package:task_flutter/models/chat_model.dart';

class UserModel {
  String name;
  bool isOnline;
  String? imagePath;
  String? lastOnline;
  UserModel({
    required this.name,
    required this.isOnline,
    required this.imagePath,
    this.lastOnline,
  });
}

List<UserModel> onlineUsers = [
  for (int i = 0; i < 12; i++)
    UserModel(
      name: userNames[Random.secure().nextInt(userNames.length)],
      isOnline: true,
      imagePath: userImages[Random.secure().nextInt(userImages.length)],
    ),
];
final String imagePath = 'assets/images/';
final List<String> userImages = [
  imagePath + 'person_image.jpg',
  for (int i = 2; i <= 17; i++) '${imagePath}person$i.jpg',
];
