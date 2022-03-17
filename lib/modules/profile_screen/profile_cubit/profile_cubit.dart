import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taajer/modules/profile_screen/profile_cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);
  IconData passwordSuffixIcon = Icons.visibility_off_outlined;
  bool obscureText = true;

  void changePasswordVisibility() {
    obscureText = !obscureText;

    passwordSuffixIcon =
        obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ProfileChangePasswordVisibilityState());
  }
}
