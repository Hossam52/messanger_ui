import 'package:flutter/material.dart';
import 'package:task_flutter/models/user_model.dart';
import 'package:task_flutter/widgets/user_avatar.dart';
import '../utils/helpers/extentions.dart';

class OnlineUserItem extends StatelessWidget {
  OnlineUserItem({Key? key, required this.onlineUser}) : super(key: key);
  final UserModel? onlineUser;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth / 4.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(flex: 4, child: _buildUserAvatar()),
          SizedBox(height: 5),
          Center(child: _buildUserName()),
        ],
      ),
    );
  }

  Widget _buildUserAvatar() {
    if (onlineUser == null) return _buildCreateRoomIcon();
    return UserAvatar(user: onlineUser!);
  }

  Widget _buildUserName() {
    return Text(onlineUser == null ? 'Create Room' : onlineUser!.name,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16));
  }

  Widget _buildCreateRoomIcon() {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        radius: double.infinity,
        backgroundColor: Colors.grey,
        child: Icon(
          Icons.video_call_rounded,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
