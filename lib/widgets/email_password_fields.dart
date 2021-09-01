import 'package:flutter/material.dart';
import 'package:task_flutter/widgets/custom_text_field.dart';

class EmailPasswordFields extends StatefulWidget {
  const EmailPasswordFields({Key? key}) : super(key: key);

  @override
  _EmailPasswordFieldsState createState() => _EmailPasswordFieldsState();
}

class _EmailPasswordFieldsState extends State<EmailPasswordFields> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
            hintText: 'Email', icon: Icons.email, validator: _validateEmail),
        SizedBox(height: 20),
        CustomTextField(
          hintText: 'Password',
          icon: Icons.security_outlined,
          obsecureText: true,
          validator: _validatePassword,
          showPassword: _showPassword,
          onChangeVisibilty: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }

  String? _validateEmail(String? text) {
    if (text!.isEmpty) return 'Email fireld can not be empty';
    return null;
  }

  String? _validatePassword(String? text) {
    if (text!.isEmpty) return 'Password fireld can not be empty';

    return null;
  }
}
