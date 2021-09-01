import 'package:flutter/material.dart';
import 'package:task_flutter/screens/welcome_screen.dart';
import 'package:task_flutter/widgets/custom_button.dart';
import 'package:task_flutter/widgets/custom_text_field.dart';
import 'package:task_flutter/widgets/email_password_fields.dart';
import 'package:task_flutter/widgets/social_label_text.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
              const SocialLabelText(label: 'Sign Up'),
              const SizedBox(height: 20),
              CustomTextField(
                  hintText: 'User name',
                  icon: Icons.person,
                  validator: validateUserName),
              const SizedBox(height: 20),
              EmailPasswordFields(),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      navigateToChats(context);
                    }
                  },
                  borderRadius: 10,
                  backgroundColor: Color(Colors.grey[900]!.value + 130),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? validateUserName(String? text) {
    if (text!.isEmpty) return 'User name can not be emtpy';
    if (text.length < 5) return 'User name must be greater than 5';
    return null;
  }
}
