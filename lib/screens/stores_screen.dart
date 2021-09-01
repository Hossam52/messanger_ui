import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_flutter/models/header_icon_model.dart';
import 'package:task_flutter/models/story_model.dart';
import 'package:task_flutter/widgets/header_widget.dart';
import 'package:task_flutter/widgets/story_item.dart';

class StoresScreen extends StatelessWidget {
  final XFile? backgroundImageFile;
  StoresScreen({Key? key, this.backgroundImageFile}) : super(key: key);
  final icons = [
    HeaderIconModel(
      icon: Icons.perm_contact_cal_sharp,
      onPressed: () {},
    ),
    HeaderIconModel(
      icon: Icons.supervised_user_circle,
      onPressed: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: backgroundImageFile == null
              ? null
              : DecorationImage(
                  image: FileImage(File(backgroundImageFile!.path)),
                  fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor:
            backgroundImageFile != null ? Colors.transparent : Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  BackButton(),
                  Expanded(
                      child: HeaderWidget(icons: icons, headerTitle: 'People')),
                ],
              ),
              Expanded(child: _buildStories())
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStories() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 1.5),
        itemBuilder: (_, index) => StoryItem(story: stories[index]),
        itemCount: stories.length,
      ),
    );
  }
}
