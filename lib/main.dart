import 'package:day_1/blocs/internet_bloc.dart';
import 'package:day_1/cubit/internet_cubit.dart';
import 'package:day_1/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
