abstract class SignInTextEvent {}

class SignInTextChangedEvent extends SignInTextEvent {
  final String emailValue;
  final String passwordValue;
  SignInTextChangedEvent(
      {required this.emailValue, required this.passwordValue});
}

class SignInSubmittedEvent extends SignInTextEvent {
  final String email;
  final String password;
  SignInSubmittedEvent({required this.email, required this.password});
}

// class SignInTextErrorEvent extends SignInTextEvent {}

// class SignInSuccessEvent extends SignInTextEvent {}
