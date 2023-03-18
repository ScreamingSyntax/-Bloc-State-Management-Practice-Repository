abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInErrorState extends SignInState {
  final String errorMessage;
  SignInErrorState({required this.errorMessage});
}

class SignInSucesssstate extends SignInState {}

class SignInLoadingState extends SignInState {}
