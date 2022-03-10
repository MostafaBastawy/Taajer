abstract class AuthenticationStates {}

class AuthenticationStatesInitialState extends AuthenticationStates {}

class AuthenticationStatesRefreshState extends AuthenticationStates {}

class AuthenticationChangePasswordVisibilityState extends AuthenticationStates {
}

class AuthenticationUserRegisterLoadingState extends AuthenticationStates {}

class AuthenticationUserRegisterSuccessState extends AuthenticationStates {}

class AuthenticationUserRegisterErrorState extends AuthenticationStates {
  String error;
  AuthenticationUserRegisterErrorState(this.error);
}

class AuthenticationUserRegisterOtpVerificationLoadingState
    extends AuthenticationStates {}

class AuthenticationUserRegisterOtpVerificationSuccessState
    extends AuthenticationStates {}

class AuthenticationUserRegisterOtpVerificationErrorState
    extends AuthenticationStates {
  String error;
  AuthenticationUserRegisterOtpVerificationErrorState(this.error);
}

class AuthenticationUserResendOtpVerificationLoadingState
    extends AuthenticationStates {}

class AuthenticationUserResendOtpVerificationSuccessState
    extends AuthenticationStates {}

class AuthenticationUserResendOtpVerificationErrorState
    extends AuthenticationStates {
  String error;
  AuthenticationUserResendOtpVerificationErrorState(this.error);
}

class AuthenticationUserPreLoginLoadingState extends AuthenticationStates {}

class AuthenticationUserPreLoginSuccessState extends AuthenticationStates {}

class AuthenticationUserPreLoginErrorState extends AuthenticationStates {
  String error;
  AuthenticationUserPreLoginErrorState(this.error);
}

class AuthenticationUserLoginLoadingState extends AuthenticationStates {}

class AuthenticationUserLoginSuccessState extends AuthenticationStates {}

class AuthenticationUserLoginErrorState extends AuthenticationStates {
  String error;
  AuthenticationUserLoginErrorState(this.error);
}

class AuthenticationForgetPasswordRequestLoadingState
    extends AuthenticationStates {}

class AuthenticationForgetPasswordRequestSuccessState
    extends AuthenticationStates {}

class AuthenticationForgetPasswordRequestErrorState
    extends AuthenticationStates {
  String error;
  AuthenticationForgetPasswordRequestErrorState(this.error);
}

class AuthenticationUserForgetPasswordResendOtpVerificationLoadingState
    extends AuthenticationStates {}

class AuthenticationUserForgetPasswordResendOtpVerificationSuccessState
    extends AuthenticationStates {}

class AuthenticationUserForgetPasswordResendOtpVerificationErrorState
    extends AuthenticationStates {
  String error;
  AuthenticationUserForgetPasswordResendOtpVerificationErrorState(this.error);
}

class AuthenticationUserForgetPasswordOtpVerificationLoadingState
    extends AuthenticationStates {}

class AuthenticationUserForgetPasswordOtpVerificationSuccessState
    extends AuthenticationStates {}

class AuthenticationUserForgetPasswordOtpVerificationErrorState
    extends AuthenticationStates {
  String error;
  AuthenticationUserForgetPasswordOtpVerificationErrorState(this.error);
}
