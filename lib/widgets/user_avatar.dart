import 'package:flutter/material.dart';
import 'package:task_flutter/models/user_model.dart';
import '../utils/helpers/extentions.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key, required this.user}) : super(key: key);
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.getWidth / 4.8,
        child: Stack(
          children: [
            _buildUserImageAvatar(),
            Positioned(
              bottom: 1,
              right: 5,
              child: _buildBottomRightWidget(),
            )
          ],
        ));
  }

  Widget _buildUserImageAvatar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(user.imagePath!), fit: BoxFit.fill)),
    );
  }

  Widget _buildBottomRightWidget() {
    if (user.isOnline)
      return CircleAvatar(
          radius: 10,
          backgroundColor: Colors.black,
          child: CircleAvatar(radius: 7, backgroundColor: Colors.green));
    else if (user.lastOnline != null)
      return Container(
        decoration: BoxDecoration(
            border: Border.all(width: 2.2),
            color: Colors.black,
            borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
          child: Text(user.lastOnline!,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          decoration: BoxDecoration(
              color: Colors.green.shade200,
              borderRadius: BorderRadius.circular(10)),
        ),
      );
    else
      return Container();
  }
}
