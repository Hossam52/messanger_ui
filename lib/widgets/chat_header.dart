import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_flutter/models/chat_model.dart';
import 'package:task_flutter/widgets/user_avatar.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: UserAvatar(
        user: chatModel.user,
      ),
      title: _buildTextAccordingToUnReadedState(chatModel.user.name),
      subtitle: _buildTextAccordingToUnReadedState(
          chatModel.lastMessegeContent), // Text(chatModel.lastMessegeContent),
      trailing: _buildTextAccordingToUnReadedState(
          DateFormat('hh:mm a').format(chatModel.lastMessegeTime),
          fontSize: 14),
    );
  }

  Widget _buildTextAccordingToUnReadedState(String text,
      {double fontSize = 18.0}) {
    final Color fontColor =
        chatModel.hasUnreadedMesseges ? Colors.white : Colors.grey;
    if (chatModel.hasUnreadedMesseges) {
      return Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: fontSize, color: fontColor),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
    } else
      return Text(text,
          style: TextStyle(
            fontSize: fontSize,
            color: fontColor,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1);
  }
}
