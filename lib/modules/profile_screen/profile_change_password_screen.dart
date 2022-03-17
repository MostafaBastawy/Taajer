import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/modules/profile_screen/profile_cubit/profile_cubit.dart';
import 'package:taajer/modules/profile_screen/profile_cubit/profile_states.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/styles/colors.dart';

class ProfileChangePasswordScreen extends StatelessWidget {
  var currentPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmNewPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? activeTextFormField;
  String currentPasswordValidationMessage = '';
  String newPasswordValidationMessage = '';
  String confirmNewPasswordValidationMessage = '';
  Color currentPasswordBorder = const Color(0xFFE2E4E8);
  Color newPasswordBorder = const Color(0xFFE2E4E8);
  Color confirmNewPasswordBorder = const Color(0xFFE2E4E8);
  List<BoxShadow> currentPasswordShadowBorder = [];
  List<BoxShadow> newPasswordShadowBorder = [];
  List<BoxShadow> confirmNewPasswordShadowBorder = [];
  ProfileChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = ProfileCubit.get(context);
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (BuildContext context, state) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              'assets/images/arrow-left-icon.svg',
              height: 32.h,
              width: 32.w,
            ),
          ),
          title: const Text('Change password'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
          child: Column(
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(start: 16.w),
                width: 343.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1.0,
                    color: activeTextFormField == 'Current Password'
                        ? figmaActiveColor
                        : currentPasswordBorder,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(6.r),
                  boxShadow: activeTextFormField == 'Current Password'
                      ? borderActiveBoxShadow
                      : currentPasswordShadowBorder,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: currentPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        maxLines: 1,
                        obscureText: cubit.obscureText,
                        onChanged: (value) {},
                        onFieldSubmitted: (value) {},
                        validator: (value) {},
                        onTap: () {
                          activeTextFormField = 'Current Password';
                          cubit.emit(ProfileStatesRefreshState());
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Current Password',
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFB2B7C2),
                            height: 1.6,
                          ),
                        ),
                      ),
                    ),
                    if (activeTextFormField == 'Current Password')
                      SizedBox(width: 10.w),
                    if (activeTextFormField == 'Current Password')
                      GestureDetector(
                        onTap: () {
                          confirmNewPasswordController.text = '';
                        },
                        child: SvgPicture.asset(
                          'assets/images/delete-icon.svg',
                          width: 16.67.w,
                          height: 16.67.h,
                        ),
                      ),
                    if (activeTextFormField == 'Current Password')
                      SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () {
                        cubit.changePasswordVisibility();
                      },
                      child: Icon(
                        cubit.passwordSuffixIcon,
                        color: figmaGrey1,
                      ),
                    ),
                    SizedBox(width: 17.12.w),
                  ],
                ),
              ),
              if (currentPasswordValidationMessage.isNotEmpty)
                SizedBox(height: 5.5.h),
              if (currentPasswordValidationMessage.isNotEmpty)
                Row(
                  children: [
                    SvgPicture.asset('assets/images/error-icon.svg'),
                    SizedBox(width: 10.w),
                    Text(
                      currentPasswordValidationMessage,
                      style: TextStyle(
                        color: const Color(0xFFFF3236),
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 15.h),
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
                          } else {
                            newPasswordBorder = const Color(0xFFE2E4E8);
                            newPasswordShadowBorder = [];
                            newPasswordValidationMessage = '';
                          }
                        },
                        onTap: () {
                          activeTextFormField = 'New Password';
                          cubit.emit(ProfileStatesRefreshState());
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'New Password',
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFB2B7C2),
                            height: 1.6,
                          ),
                        ),
                      ),
                    ),
                    if (activeTextFormField == 'New Password')
                      SizedBox(width: 10.w),
                    if (activeTextFormField == 'New Password')
                      GestureDetector(
                        onTap: () {
                          newPasswordController.text = '';
                        },
                        child: SvgPicture.asset(
                          'assets/images/delete-icon.svg',
                          width: 16.67.w,
                          height: 16.67.h,
                        ),
                      ),
                    if (activeTextFormField == 'New Password')
                      SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () {
                        cubit.changePasswordVisibility();
                      },
                      child: Icon(
                        cubit.passwordSuffixIcon,
                        color: figmaGrey1,
                      ),
                    ),
                    SizedBox(width: 17.12.w),
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
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 15.h),
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
                          } else if (confirmNewPasswordController.text !=
                              newPasswordController.text) {
                            confirmNewPasswordBorder = figmaErrorColor;
                            confirmNewPasswordShadowBorder =
                                borderErrorBoxShadow;
                            confirmNewPasswordValidationMessage =
                                'Confirm Password is not match';
                          } else {
                            confirmNewPasswordBorder = const Color(0xFFE2E4E8);
                            confirmNewPasswordShadowBorder = [];
                            confirmNewPasswordValidationMessage = '';
                          }
                        },
                        onTap: () {
                          activeTextFormField = 'Confirm New Password';
                          cubit.emit(ProfileStatesRefreshState());
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm New Password',
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFB2B7C2),
                            height: 1.6,
                          ),
                        ),
                      ),
                    ),
                    if (activeTextFormField == 'Confirm New Password')
                      SizedBox(width: 10.w),
                    if (activeTextFormField == 'Confirm New Password')
                      GestureDetector(
                        onTap: () {
                          confirmNewPasswordController.text = '';
                        },
                        child: SvgPicture.asset(
                          'assets/images/delete-icon.svg',
                          width: 16.67.w,
                          height: 16.67.h,
                        ),
                      ),
                    if (activeTextFormField == 'Confirm New Password')
                      SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () {
                        cubit.changePasswordVisibility();
                      },
                      child: Icon(
                        cubit.passwordSuffixIcon,
                        color: figmaGrey1,
                      ),
                    ),
                    SizedBox(width: 17.12.w),
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
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 45.h),
              DefaultButton(
                height: 48.h,
                width: 344.w,
                label: 'Confirm',
                onPressed: () {},
                labelColor: Colors.white,
                labelWeight: FontWeight.w700,
                labelFontSize: 18.sp,
                labelFontHeight: 1.25,
                backGroundColor: figmaPrimaryBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
