abstract class AuthenticationStates {}

class AuthenticationStatesInitialState extends AuthenticationStates {}

class AuthenticationStatesRefreshState extends AuthenticationStates {}

class AuthenticationChangePasswordVisibilityState extends AuthenticationStates {
}

class AuthenticationRegisterStep1LoadingState extends AuthenticationStates {}

class AuthenticationRegisterStep1SuccessState extends AuthenticationStates {}

class AuthenticationRegisterStep1ErrorState extends AuthenticationStates {
  String error;
  AuthenticationRegisterStep1ErrorState(this.error);
}
