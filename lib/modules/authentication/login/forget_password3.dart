import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/styles/colors.dart';

class ForgetPassword3 extends StatelessWidget {
  var newPasswordController = TextEditingController();
  var confirmNewPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? activeTextFormField;
  String newPasswordValidationMessage = '';
  String confirmNewPasswordValidationMessage = '';
  Color newPasswordBorder = const Color(0xFFE2E4E8);
  Color confirmNewPasswordBorder = const Color(0xFFE2E4E8);
  List<BoxShadow> newPasswordShadowBorder = [];
  List<BoxShadow> confirmNewPasswordShadowBorder = [];
  ForgetPassword3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationCubit cubit = AuthenticationCubit.get(context);

    return BlocBuilder<AuthenticationCubit, AuthenticationStates>(
      builder: (BuildContext context, state) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reset Password',
                  style: TextStyle(
                    color: figmaOurBlack,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.165,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Please enter a new password',
                  style: TextStyle(
                    color: const Color(0xFF76777E),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.165,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(height: 26.h),
                Container(
                  padding: EdgeInsetsDirectional.only(start: 16.w),
                  width: 343.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1.0,
                      color: activeTextFormField == 'New Password'
                          ? figmaActiveColor
                          : newPasswordBorder,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(6.r),
                    boxShadow: activeTextFormField == 'New Password'
                        ? borderActiveBoxShadow
                        : newPasswordShadowBorder,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: newPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          maxLines: 1,
                          obscureText: cubit.obscureText,
                          onChanged: (value) {},
                          onFieldSubmitted: (value) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              newPasswordBorder = figmaErrorColor;
                              newPasswordShadowBorder = borderErrorBoxShadow;
                              newPasswordValidationMessage =
                                  'Password cant be empty';
                            } else if (confirmNewPasswordController.text !=
                                newPasswordController.text) {
                              newPasswordBorder = figmaErrorColor;
                              newPasswordShadowBorder = borderErrorBoxShadow;
                              newPasswordValidationMessage =
                                  'Confirm Password is not match';
                            } else {
                              newPasswordBorder = const Color(0xFFE2E4E8);
                              newPasswordShadowBorder = [];
                              newPasswordValidationMessage = '';
                            }
                          },
                          onTap: () {
                            activeTextFormField = 'New Password';
                            cubit.emit(AuthenticationStatesRefreshState());
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'New Password',
                            hintStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFB2B7C2),
                              height: 1.6,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          cubit.changePasswordVisibility();
                        },
                        icon: Icon(cubit.passwordSuffixIcon),
                        color: figmaGrey1,
                      ),
                    ],
                  ),
                ),
                if (newPasswordValidationMessage.isNotEmpty)
                  SizedBox(height: 5.5.h),
                if (newPasswordValidationMessage.isNotEmpty)
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/error-icon.svg'),
                      SizedBox(width: 10.w),
                      Text(
                        newPasswordValidationMessage,
                        style: TextStyle(
                          color: const Color(0xFFFF3236),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsetsDirectional.only(start: 16.w),
                  width: 343.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1.0,
                      color: activeTextFormField == 'Confirm New Password'
                          ? figmaActiveColor
                          : confirmNewPasswordBorder,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(6.r),
                    boxShadow: activeTextFormField == 'Confirm New Password'
                        ? borderActiveBoxShadow
                        : confirmNewPasswordShadowBorder,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: confirmNewPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          maxLines: 1,
                          obscureText: cubit.obscureText,
                          onChanged: (value) {},
                          onFieldSubmitted: (value) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              confirmNewPasswordBorder = figmaErrorColor;
                              confirmNewPasswordShadowBorder =
                                  borderErrorBoxShadow;
                              confirmNewPasswordValidationMessage =
                                  'Password cant be empty';
                            } else {
                              confirmNewPasswordBorder =
                                  const Color(0xFFE2E4E8);
                              confirmNewPasswordShadowBorder = [];
                              confirmNewPasswordValidationMessage = '';
                            }
                          },
                          onTap: () {
                            activeTextFormField = 'Confirm New Password';
                            cubit.emit(AuthenticationStatesRefreshState());
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirm New Password',
                            hintStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFB2B7C2),
                              height: 1.6,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          cubit.changePasswordVisibility();
                        },
                        icon: Icon(cubit.passwordSuffixIcon),
                        color: figmaGrey1,
                      ),
                    ],
                  ),
                ),
                if (confirmNewPasswordValidationMessage.isNotEmpty)
                  SizedBox(height: 5.5.h),
                if (confirmNewPasswordValidationMessage.isNotEmpty)
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/error-icon.svg'),
                      SizedBox(width: 10.w),
                      Text(
                        confirmNewPasswordValidationMessage,
                        style: TextStyle(
                          color: const Color(0xFFFF3236),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                const Spacer(),
                DefaultButton(
                  height: 46.h,
                  width: 344.w,
                  label: 'Submit',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.emit(AuthenticationStatesRefreshState());
                    }
                  },
                  labelColor: Colors.white,
                  labelWeight: FontWeight.w700,
                  backGroundColor: figmaPrimaryBlue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
