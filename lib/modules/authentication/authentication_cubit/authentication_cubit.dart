import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:taajer/models/login_model.dart';
import 'package:taajer/models/otp_verification.dart';
import 'package:taajer/models/pre_login_model.dart';
import 'package:taajer/models/user_registeration.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/shared/end_points.dart';

class AuthenticationCubit extends Cubit<AuthenticationStates> {
  AuthenticationCubit() : super(AuthenticationStatesInitialState());

  static AuthenticationCubit get(context) => BlocProvider.of(context);
  IconData passwordSuffixIcon = Icons.visibility_off_outlined;
  bool obscureText = true;

  void changePasswordVisibility() {
    obscureText = !obscureText;

    passwordSuffixIcon =
        obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(AuthenticationChangePasswordVisibilityState());
  }

  UserRegistrationModel? userRegistrationModel;

  void userRegister({
    required String email,
    required String password,
    required String phone,
    required String name,
    required String phoneCode,
  }) async {
    emit(AuthenticationUserRegisterLoadingState());

    http.post(
      Uri.parse(
        '$baseUrl$signUp',
      ),
      body: {
        'email': email,
        'password': password,
        'user_type': 'seller',
        'phone': phone,
        'name': name,
        'first_name': 'pop',
        'last_name': 'pop',
        'phone_code': phoneCode,
      },
    ).then((value) {
      if (value.statusCode == 200 && jsonDecode(value.body)['result']) {
        userRegistrationModel =
            UserRegistrationModel.fromJson(jsonDecode(value.body));
        emit(AuthenticationUserRegisterSuccessState());
      } else if (value.statusCode == 201) {
        if (jsonDecode(value.body)['result']) {
          userRegistrationModel =
              UserRegistrationModel.fromJson(jsonDecode(value.body));
          emit(AuthenticationUserRegisterSuccessState());
        } else {
          emit(AuthenticationUserRegisterErrorState(
              jsonDecode(value.body)['message']));
        }
      } else {
        emit(AuthenticationUserRegisterErrorState(
            jsonDecode(value.body)['message']));
      }
    }).catchError((error) {
      emit(AuthenticationUserRegisterErrorState(error.toString()));
    });
  }

  OtpVerificationModel? otpVerificationModel;

  void userRegisterOtpVerification({
    required String otpVerificationCode,
  }) async {
    emit(AuthenticationUserRegisterOtpVerificationLoadingState());

    http.post(
      Uri.parse(
        '$baseUrl$confirmOtpCode',
      ),
      body: {
        'user_id': userRegistrationModel!.registerUserId.toString(),
        'verification_code': otpVerificationCode
      },
    ).then((value) {
      if (value.statusCode == 200 && jsonDecode(value.body)['result']) {
        otpVerificationModel =
            OtpVerificationModel.fromJson(jsonDecode(value.body));
        emit(AuthenticationUserRegisterOtpVerificationSuccessState());
      } else if (value.statusCode == 201) {
        if (jsonDecode(value.body)['result']) {
          otpVerificationModel =
              OtpVerificationModel.fromJson(jsonDecode(value.body));
          emit(AuthenticationUserRegisterOtpVerificationSuccessState());
        } else {
          emit(AuthenticationUserRegisterOtpVerificationErrorState(
              jsonDecode(value.body)['message']));
        }
      } else {
        emit(AuthenticationUserRegisterOtpVerificationErrorState(
            jsonDecode(value.body)['message']));
      }
    }).catchError((error) {
      emit(AuthenticationUserRegisterOtpVerificationErrorState(
          error.toString()));
    });
  }

  void userResendOtpVerification() {
    emit(AuthenticationUserResendOtpVerificationLoadingState());

    http.post(
      Uri.parse(
        '$baseUrl$resendOtpCode',
      ),
      body: {
        'user_id': userRegistrationModel!.registerUserId.toString(),
      },
    ).then((value) {
      if (value.statusCode == 200 && jsonDecode(value.body)['result']) {
        otpVerificationModel =
            OtpVerificationModel.fromJson(jsonDecode(value.body));
        emit(AuthenticationUserResendOtpVerificationSuccessState());
      } else if (value.statusCode == 201) {
        if (jsonDecode(value.body)['result']) {
          otpVerificationModel =
              OtpVerificationModel.fromJson(jsonDecode(value.body));
          emit(AuthenticationUserResendOtpVerificationSuccessState());
        } else {
          emit(AuthenticationUserResendOtpVerificationErrorState(
              jsonDecode(value.body)['message']));
        }
      } else {
        emit(AuthenticationUserResendOtpVerificationErrorState(
            jsonDecode(value.body)['message']));
      }
    }).catchError((error) {
      emit(AuthenticationUserResendOtpVerificationErrorState(error.toString()));
    });
  }

  PreLoginModel? preLoginModel;
  void userPreLogin({
    required String emailAddress,
  }) async {
    emit(AuthenticationUserPreLoginLoadingState());

    http.post(
      Uri.parse(
        '$baseUrl$preLogin',
      ),
      body: {
        'email': emailAddress,
      },
    ).then((value) {
      if (value.statusCode == 200 && jsonDecode(value.body)['result']) {
        preLoginModel = PreLoginModel.fromJson(jsonDecode(value.body));
        emit(AuthenticationUserPreLoginSuccessState());
      } else if (value.statusCode == 201) {
        if (jsonDecode(value.body)['result']) {
          preLoginModel = PreLoginModel.fromJson(jsonDecode(value.body));
          emit(AuthenticationUserPreLoginSuccessState());
        } else {
          emit(AuthenticationUserPreLoginErrorState(
              jsonDecode(value.body)['message']));
        }
      } else {
        emit(AuthenticationUserPreLoginErrorState(
            jsonDecode(value.body)['message']));
      }
    }).catchError((error) {
      emit(AuthenticationUserPreLoginErrorState(error.toString()));
    });
  }

  LoginModel? loginModel;
  void userLogin({
    required String emailAddress,
    required String password,
  }) async {
    emit(AuthenticationUserLoginLoadingState());

    http.post(
      Uri.parse(
        '$baseUrl$login',
      ),
      headers: {'Accept': 'application/json'},
      body: {
        'email': emailAddress,
        'password': password,
      },
    ).then((value) {
      if (value.statusCode == 200 && jsonDecode(value.body)['result']) {
        loginModel = LoginModel.fromJson(jsonDecode(value.body));
        emit(AuthenticationUserLoginSuccessState());
      } else if (value.statusCode == 201) {
        if (jsonDecode(value.body)['result']) {
          loginModel = LoginModel.fromJson(jsonDecode(value.body));
          emit(AuthenticationUserLoginSuccessState());
        } else {
          emit(AuthenticationUserLoginErrorState(
              jsonDecode(value.body)['message']));
        }
      } else {
        emit(AuthenticationUserLoginErrorState(
            jsonDecode(value.body)['message']));
      }
    }).catchError((error) {
      emit(AuthenticationUserLoginErrorState(error.toString()));
    });
  }
}
