import 'dart:math';

import 'package:intl/intl.dart';
import 'package:task_flutter/models/user_model.dart';

class ChatModel {
  UserModel user;
  String lastMessegeContent;
  DateTime lastMessegeTime;
  bool senderIsMe;
  bool hasUnreadedMesseges;
  ChatModel({
    required this.user,
    required this.lastMessegeContent,
    required this.lastMessegeTime,
    required this.senderIsMe,
    required this.hasUnreadedMesseges,
  });
}

List<ChatModel> allChats = [
  for (int i = 0; i < 20; i++)
    ChatModel(
        user: UserModel(
            name: userNames[Random.secure().nextInt(userNames.length)],
            isOnline: Random.secure().nextBool(),
            imagePath: images[Random.secure().nextInt(images.length)],
            lastOnline: lastOnline[Random.secure().nextInt(lastOnline.length)]),
        lastMessegeContent:
            _lastMesseges[Random.secure().nextInt(_lastMesseges.length)],
        lastMessegeTime: DateTime.now().subtract(Duration(
            hours: Random.secure().nextInt(23),
            minutes: Random.secure().nextInt(60))),
        senderIsMe: Random.secure().nextBool(),
        hasUnreadedMesseges: Random.secure().nextBool()),
];
List<String> userNames = [
  'Doaa Saber',
  'الجروب',
  'Osama M. Soliman',
  'Salah Abido',
  'Mohamed Hassan',
  'Ahmed Khairy',
  'Ahmed Ashraf',
  'Mohamed Mohsen',
  'Omar Ahmed',
  'Trim Alex',
  'آلاء جاد',
  'Abdullah Mouawad'
];
List<String> _lastMesseges = [
  'بس احنا لو دخلنا سي اس هيكون افضل بكتير',
  'Daved Sent a photo',
  'مشغله',
  'لما افتح هعملك share screen وتشوف الدنيا',
  'You sent a job application',
  'You unsent a messege',
  'عشان مينفعش تكون كدا لازم تظبطها اكتر',
  'ربنا معاك يباشمهندس وعقبال اما تتخرج يارب',
  'Ok don\'t watste my time please',
  'Ok',
];
List<String> lastOnline = [
  '5m',
  '1h',
  '2h',
  '41m',
  '57m',
  '55m',
  '1m',
  '20m',
  '10h',
  '21h',
  '22h',
  '3m',
  '8m',
  '9m',
  '10m'
];

final _imagePath = 'assets/images/image';
List<String> images = [
  for (int i = 1; i <= 17; i++) '$_imagePath$i.jpg',
];
