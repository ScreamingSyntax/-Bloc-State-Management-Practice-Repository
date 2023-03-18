import 'package:day_1/screens/signin/bloc/sign_in_bloc.dart';
import 'package:day_1/screens/signin/bloc/sign_in_event.dart';
import 'package:day_1/screens/signin/bloc/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _emailValue = TextEditingController();
  TextEditingController _passwordValue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMessage,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
              TextFormField(
                controller: _emailValue,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangedEvent(
                          emailValue: _emailValue.text,
                          passwordValue: _passwordValue.text));
                },
                decoration: const InputDecoration(hintText: "Enter Email"),
              ),
              TextFormField(
                  controller: _passwordValue,
                  onChanged: (value) {
                    BlocProvider.of<SignInBloc>(context).add(
                        SignInTextChangedEvent(
                            emailValue: _emailValue.text,
                            passwordValue: _passwordValue.text));
                  },
                  decoration:
                      const InputDecoration(hintText: "Enter Password")),
              SizedBox(
                height: 32,
              ),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return ElevatedButton(
                    child: Text("Sign in with email"),
                    onPressed: () => {
                      if (state is SignInSucesssstate)
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInSubmittedEvent(
                                email: _emailValue.text,
                                password: _passwordValue.text))
                    },
                    style: ButtonStyle(
                        backgroundColor: (state is SignInSucesssstate)
                            ? MaterialStatePropertyAll(Colors.blue)
                            : MaterialStatePropertyAll(Colors.green)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
