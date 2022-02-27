import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/styles/colors.dart';

class LoginScreen2 extends StatelessWidget {
  var passwordController = TextEditingController();
  LoginScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationCubit cubit = AuthenticationCubit.get(context);

    return BlocBuilder<AuthenticationCubit, AuthenticationStates>(
      builder: (BuildContext context, state) => Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_sharp,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Business Name',
                style: TextStyle(
                  color: primaryBlack,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.165,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Please sign in to your account',
                style: TextStyle(
                  color: const Color(0xAF76777E),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.165,
                ),
              ),
              SizedBox(height: 25.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                width: 343.w,
                height: 48.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xAFE2E4E8),
                  ),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  maxLines: 1,
                  obscureText: cubit.isPasswordShown,
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {},
                  validator: (value) {},
                  onTap: () {},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFB2B7C2),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        cubit.changePasswordVisibility();
                      },
                      icon: Icon(cubit.passwordSuffixIcon),
                      color: const Color(0xAFE2E4E8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14.h),
              Row(
                children: [
                  const Spacer(),
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: primaryBlue,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.165,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              DefaultButton(
                height: 46.h,
                width: 344.w,
                label: 'Sign in',
                onPressed: () {},
                labelColor: Colors.white,
                labelWeight: FontWeight.w700,
                backGroundColor: primaryBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
