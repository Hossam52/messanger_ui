import 'package:flutter/material.dart';
import 'package:task_flutter/screens/welcome_screen.dart';
import 'package:task_flutter/widgets/custom_button.dart';
import 'package:task_flutter/widgets/custom_text_field.dart';
import 'package:task_flutter/widgets/email_password_fields.dart';
import 'package:task_flutter/widgets/social_label_text.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SocialLabelText(label: 'Log In'),
              SizedBox(height: 20),
              EmailPasswordFields(),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  text: 'Sign In',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      navigateToChats(context);
                    }
                  },
                  borderRadius: 10,
                  backgroundColor: Colors.blue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
