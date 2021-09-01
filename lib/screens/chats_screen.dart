import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_flutter/models/chat_model.dart';
import 'package:task_flutter/models/header_icon_model.dart';
import 'package:task_flutter/models/user_model.dart';
import 'package:task_flutter/screens/stores_screen.dart';
import 'package:task_flutter/widgets/chat_header.dart';
import 'package:task_flutter/widgets/custom_text_field.dart';
import 'package:task_flutter/widgets/header_widget.dart';
import 'package:task_flutter/widgets/online_user_item.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  XFile? _selectedImageFile;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final List<HeaderIconModel> icons = [
      HeaderIconModel(
          icon: Icons.camera_alt,
          onPressed: () async {
            _showImageSourceSelection(context);
          }),
      HeaderIconModel(
          icon: Icons.edit,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => StoresScreen(
                          backgroundImageFile: _selectedImageFile,
                        )));
          }),
    ];
    return Container(
      decoration: BoxDecoration(
          image: _selectedImageFile == null
              ? null
              : DecorationImage(
                  image: FileImage(File(_selectedImageFile!.path)),
                  fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor:
            _selectedImageFile != null ? Colors.transparent : Colors.black,
        body: SafeArea(
            child: Column(
          children: [
            HeaderWidget(
              icons: icons,
              headerTitle: 'Chats',
            ),
            _buildChatSearch(),
            Expanded(child: _buildOnlineUsers()),
            SizedBox(height: 10),
            Expanded(flex: 4, child: _buildChatHeaders())
          ],
        )),
      ),
    );
  }

  Widget _buildChatSearch() {
    return CustomTextField(
        hintText: 'Search',
        icon: Icons.search,
        backgroundColor: Colors.grey.shade800);
  }

  Widget _buildOnlineUsers() {
    final List<UserModel?> list = List.from(onlineUsers);

    list.insert(0, null);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) => OnlineUserItem(onlineUser: list[index]),
      itemCount: list.length,
    );
  }

  Widget _buildChatHeaders() {
    return ListView.builder(
      itemBuilder: (_, index) => ChatHeader(chatModel: allChats[index]),
      itemCount: allChats.length,
    );
  }

  void _getImageFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _selectedImageFile = pickedFile;
      });
    } else
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Image picker process failed')));
  }

  void _getImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImageFile = pickedFile;
      });
    } else
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Image picker process failed')));
  }

  void _showImageSourceSelection(BuildContext context) async {
    await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (_) => Card(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Select Image source',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                          child: _buildImageSelectionWidget(
                              'assets/images/gallery.png',
                              'Gallery',
                              _getImageFromGallery)),
                      Expanded(
                          child: _buildImageSelectionWidget(
                              'assets/images/camera.png',
                              'Camera',
                              _getImageFromCamera)),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedImageFile = null;
                        });
                      },
                      child: Text('Or Remove background',
                          style: TextStyle(color: Colors.red, fontSize: 20)))
                ],
              ),
            ));
  }

  Widget _buildImageSelectionWidget(
      String imagePath, String title, VoidCallback onPressed) {
    return Container(
        margin: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Image.asset(
            imagePath,
            width: 50,
            height: 50,
          ),
          subtitle: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            textAlign: TextAlign.center,
          ),
          onTap: () {
            Navigator.pop(context);
            onPressed();
          },
        ));
  }
}
