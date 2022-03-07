import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/modules/authentication/login/login_screen2.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/components/tools/show_toaster.dart';
import 'package:taajer/shared/patterns.dart';
import 'package:taajer/shared/styles/colors.dart';

class LoginScreen1 extends StatelessWidget {
  var emailOrPhoneController = TextEditingController();
  String? activeTextFormField;
  String emailOrPhoneValidationMessage = '';
  Color emailOrPhoneBorder = const Color(0xFFE2E4E8);
  List<BoxShadow> emailOrPhoneShadowBorder = [];
  var formKey = GlobalKey<FormState>();
  LoginScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationCubit cubit = AuthenticationCubit.get(context);
    return BlocConsumer<AuthenticationCubit, AuthenticationStates>(
      listener: (BuildContext context, state) {
        if (state is AuthenticationUserPreLoginSuccessState) {
          FocusManager.instance.primaryFocus!.unfocus();
          defaultToast(
            message: cubit.preLoginModel!.preLoginMessage!,
            color: figmaSuccessColor,
            context: context,
          );
          navigateTo(
            widget: LoginScreen2(emailController: emailOrPhoneController.text),
            context: context,
          );
        }

        if (state is AuthenticationUserPreLoginErrorState) {
          FocusManager.instance.primaryFocus!.unfocus();
          defaultToast(
            message: state.error,
            color: figmaErrorColor,
            context: context,
          );
        }
      },
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
                  'Welcome Back!',
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
                  ),
                ),
                SizedBox(height: 25.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  width: 343.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1.0,
                      color: activeTextFormField == 'Email Address'
                          ? figmaActiveColor
                          : emailOrPhoneBorder,
                    ),
                    borderRadius: BorderRadius.circular(6.r),
                    boxShadow: activeTextFormField == 'Email Address'
                        ? borderActiveBoxShadow
                        : emailOrPhoneShadowBorder,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: emailOrPhoneController,
                          keyboardType: TextInputType.emailAddress,
                          maxLines: 1,
                          obscureText: false,
                          onChanged: (value) {},
                          onFieldSubmitted: (value) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              emailOrPhoneBorder = figmaErrorColor;
                              emailOrPhoneShadowBorder = borderErrorBoxShadow;
                              emailOrPhoneValidationMessage =
                                  'Email Address cant be empty';
                            } else if (!RegExp(emailPattern).hasMatch(value)) {
                              emailOrPhoneBorder = figmaErrorColor;
                              emailOrPhoneShadowBorder = borderErrorBoxShadow;
                              emailOrPhoneValidationMessage =
                                  'Invalid email address format';
                            } else {
                              emailOrPhoneBorder = const Color(0xFFE2E4E8);
                              emailOrPhoneShadowBorder = [];
                              emailOrPhoneValidationMessage = '';
                            }
                          },
                          onTap: () {
                            activeTextFormField = 'Email Address';
                            cubit.emit(AuthenticationStatesRefreshState());
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email Address',
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
                      if (activeTextFormField == 'Email Address')
                        GestureDetector(
                          onTap: () {
                            emailOrPhoneController.text = '';
                          },
                          child: SvgPicture.asset(
                            'assets/images/delete-icon.svg',
                            width: 16.67.w,
                            height: 16.67.h,
                          ),
                        ),
                    ],
                  ),
                ),
                if (emailOrPhoneValidationMessage.isNotEmpty)
                  SizedBox(height: 5.5.h),
                if (emailOrPhoneValidationMessage.isNotEmpty)
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/error-icon.svg'),
                      SizedBox(width: 10.w),
                      Text(
                        emailOrPhoneValidationMessage,
                        style: TextStyle(
                          color: const Color(0xFFFF3236),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 14.h),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      'Forgot Email?',
                      style: TextStyle(
                        color: figmaPrimaryBlue,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.165,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                DefaultButton(
                  height: 46.h,
                  width: 344.w,
                  label: 'Next',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.emit(AuthenticationStatesRefreshState());
                      if (emailOrPhoneValidationMessage.isEmpty) {
                        cubit.userPreLogin(
                            emailAddress: emailOrPhoneController.text);
                      }
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
