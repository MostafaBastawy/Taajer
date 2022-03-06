import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/modules/authentication/login/forget_password1.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/styles/colors.dart';

class LoginScreen2 extends StatelessWidget {
  var passwordController = TextEditingController();
  String? activeTextFormField;
  Color passwordBorder = const Color(0xFFE2E4E8);
  List<BoxShadow> passwordShadowBorder = [];
  LoginScreen2({Key? key}) : super(key: key);

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
                cubit.preLoginModel!.preLoginCompanyName!,
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
                'Please sign in to your account',
                style: TextStyle(
                  color: const Color(0xFF76777E),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.165,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: 25.h),
              Container(
                padding: EdgeInsetsDirectional.only(start: 16.w),
                width: 343.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1.0,
                    color: activeTextFormField == 'Password'
                        ? figmaActiveColor
                        : passwordBorder,
                  ),
                  borderRadius: BorderRadius.circular(6.r),
                  boxShadow: activeTextFormField == 'Password'
                      ? borderActiveBoxShadow
                      : passwordShadowBorder,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        maxLines: 1,
                        obscureText: cubit.obscureText,
                        onChanged: (value) {},
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            passwordBorder = figmaErrorColor;
                            passwordShadowBorder = borderErrorBoxShadow;
                          } else {
                            passwordBorder = figmaSuccessColor;
                            passwordShadowBorder = borderSuccessBoxShadow;
                          }
                        },
                        onTap: () {
                          activeTextFormField = 'Password';
                          cubit.emit(AuthenticationStatesRefreshState());
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFB2B7C2),
                            fontStyle: FontStyle.normal,
                            height: 1.6,
                          ),
                        ),
                      ),
                    ),
                    if (activeTextFormField == 'Password')
                      SizedBox(width: 10.w),
                    if (activeTextFormField == 'Password')
                      GestureDetector(
                        onTap: () {
                          passwordController.text = '';
                        },
                        child: SvgPicture.asset(
                          'assets/images/delete-icon.svg',
                          width: 16.67.w,
                          height: 16.67.h,
                        ),
                      ),
                    if (activeTextFormField == 'Password')
                      SizedBox(width: 9.25.w),
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
              SizedBox(height: 14.h),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      navigateTo(
                        widget: ForgetPassword1(),
                        context: context,
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: figmaPrimaryBlue,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.165,
                      ),
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
                backGroundColor: figmaPrimaryBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
