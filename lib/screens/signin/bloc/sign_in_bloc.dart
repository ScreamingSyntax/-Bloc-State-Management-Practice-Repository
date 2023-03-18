import 'package:day_1/screens/signin/bloc/sign_in_event.dart';
import 'package:day_1/screens/signin/bloc/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInTextEvent, SignInState> {
  RegExp ac = RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) => {
          if (!ac.hasMatch(event.emailValue))
            {
              emit(SignInErrorState(
                  errorMessage: "The email format is incorrect"))
            }
          else if (event.passwordValue.length <= 8)
            {
              emit(SignInErrorState(
                  errorMessage:
                      "The length of the passsword is not sufficient"))
            }
          else
            {emit(SignInSucesssstate())}
        });
    on<SignInSubmittedEvent>((event, emit) => {emit(SignInLoadingState())});
  }
}
