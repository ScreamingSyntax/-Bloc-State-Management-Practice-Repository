import 'package:day_1/blocs/internet_bloc.dart';
import 'package:day_1/blocs/internet_state.dart';
import 'package:day_1/cubit/internet_cubit.dart';
import 'package:day_1/cubit/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: BlocBuilder<InternetCubit, InternetStateC>(
      builder: (context, state) {
        if (state == InternetStateC.Connected) {
          return Text("Wifi Connected");
        } else if (state == InternetStateC.Disconnected) {
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
