import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:taajer/models/register_step1_model.dart';
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

  RegisterStep1Model? registerStep1Model;
  void registerStep1({
    required String email,
    required String password,
    required String phone,
    required String name,
    required String phoneCode,
  }) async {
    emit(AuthenticationRegisterStep1LoadingState());

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
      registerStep1Model = RegisterStep1Model.fromJson(jsonDecode(value.body));
      emit(AuthenticationRegisterStep1SuccessState());
    }).catchError((error) {
      emit(AuthenticationRegisterStep1ErrorState(error.toString()));
    });
  }
}
