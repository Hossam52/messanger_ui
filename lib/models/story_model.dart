import 'dart:math';

import 'package:task_flutter/models/chat_model.dart';
import 'package:task_flutter/models/user_model.dart';

class StoryModel {
  String imagePath;
  UserModel userName;
  int storiesCount;
  StoryModel({
    required this.imagePath,
    required this.userName,
    required this.storiesCount,
  });
}

List<StoryModel> stories = [
  for (int i = 0; i < 13; i++)
    StoryModel(
        imagePath: images[Random.secure().nextInt(images.length)],
        userName: UserModel(
            name: userNames[Random.secure().nextInt(userNames.length)],
            isOnline: Random.secure().nextBool(),
            imagePath: userImages[Random.secure().nextInt(userImages.length)],
            lastOnline: lastOnline[Random.secure().nextInt(lastOnline.length)]),
        storiesCount: Random.secure().nextInt(5) + 1)
];
