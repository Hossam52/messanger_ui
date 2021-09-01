import 'package:flutter/material.dart';
import 'package:task_flutter/screens/chats_screen.dart';
import 'package:task_flutter/widgets/custom_button.dart';
import 'package:task_flutter/widgets/login_form.dart';
import 'package:task_flutter/widgets/sign_up_form.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/universe.jpg'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Spacer(flex: 1),
              _buildWelcomeWidget(),
              Spacer(flex: 5),
              _buildButtonsWidget(context),
              Spacer(flex: 1)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeWidget() {
    final style = TextStyle(color: Colors.white);
    return Column(
      children: [
        Text('Welcome',
            style: style.copyWith(fontSize: 38, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text('Welcome to the space application',
            style: style.copyWith(fontSize: 21)),
      ],
    );
  }

  Widget _buildButtonsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLoginSignUpWidget(context),
          SizedBox(height: 25),
          CustomButton(
            text: 'Continue with google',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            onPressed: () {
              navigateToChats(context);
            },
          )
        ],
      ),
    );
  }

  Widget _buildLoginSignUpWidget(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: 'Login',
            backgroundColor: Colors.purple,
            onPressed: _loginPress(context),
          ),
        ),
        SizedBox(width: 40),
        Expanded(
          child: CustomButton(
            text: 'SignUp',
            backgroundColor: Colors.lightGreen,
            onPressed: _signUpPress(context),
          ),
        ),
      ],
    );
  }

  VoidCallback _loginPress(context) {
    return () {
      showDialog(
          context: context,
          builder: (_) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: LoginForm(),
            );
          });
    };
  }

  VoidCallback _signUpPress(context) {
    return () {
      showDialog(
          context: context,
          builder: (_) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: SignUpForm(),
            );
          });
    };
  }
}

void navigateToChats(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => ChatsScreen()));
}
