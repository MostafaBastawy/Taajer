import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/styles/colors.dart';

class ForgetPassword3 extends StatelessWidget {
  var newPasswordController = TextEditingController();
  var confirmNewPasswordController = TextEditingController();
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
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFFE2E4E8),
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(6.r),
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
                        validator: (value) {},
                        onTap: () {},
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'New Password',
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFB2B7C2),
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
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsetsDirectional.only(start: 16.w),
                width: 343.w,
                height: 48.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFFE2E4E8),
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(6.r),
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
                        validator: (value) {},
                        onTap: () {},
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'New Password',
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFB2B7C2),
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
              const Spacer(),
              DefaultButton(
                height: 46.h,
                width: 344.w,
                label: 'Submit',
                onPressed: () {},
                labelColor: Colors.white,
                labelWeight: FontWeight.w700,
                backGroundColor: figmaPrimaryBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
