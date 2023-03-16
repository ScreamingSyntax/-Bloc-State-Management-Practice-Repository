import 'package:day_1/blocs/internet_bloc.dart';
import 'package:day_1/blocs/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: BlocBuilder<InternetBloc, InternetState>(
      builder: (context, state) {
        if (state is InternetConnectedState) {
          return Text("Wifi Connected");
        } else if (state is InternetLostState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Lost Connection"),
              CircularProgressIndicator(),
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Connect to a Wifi"),
              CircularProgressIndicator(),
            ],
          );
        }
      },
    )));
  }
}
