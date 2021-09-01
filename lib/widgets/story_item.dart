import 'package:flutter/material.dart';
import 'package:task_flutter/models/story_model.dart';
import 'package:task_flutter/widgets/user_avatar.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({Key? key, required this.story}) : super(key: key);
  final StoryModel story;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(alignment: Alignment.bottomLeft, children: [
        _buildBackground(),
        Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            height: 70,
            child: UserAvatar(
              user: story.userName,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.topRight, child: _buildUnreadedStories()),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildStoryUserNameWidget(),
        ),
      ]),
    );
  }

  Widget _buildBackground() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage(story.imagePath), fit: BoxFit.fill)),
    );
  }

  Widget _buildStoryUserNameWidget() {
    return Text(
      story.userName.name,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
    );
  }

  Widget _buildUnreadedStories() {
    return CircleAvatar(
        radius: 15,
        backgroundColor: Colors.grey.shade700.withAlpha(255),
        child: Text(
          story.storiesCount.toString(),
          style: TextStyle(color: Colors.white),
        ));
  }
}
