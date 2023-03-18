import 'package:day_1/screens/signin/bloc/sign_in_bloc.dart';
import 'package:day_1/screens/signin/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Text(
                "Welcome to Example",
                style: TextStyle(
                  color: Colors.blue[400],
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              bottomButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomButtons(BuildContext context) {
    return Column(
      children: [
        CupertinoButton.filled(
          child: Text("Sign in with Email"),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => SignInBloc(),
                child: LoginScreen(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
