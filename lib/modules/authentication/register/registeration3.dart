import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taajer/app_cubit/app_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/modules/home_layout.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/components/tools/show_toaster.dart';
import 'package:taajer/shared/styles/colors.dart';

class RegisterScreen3 extends StatelessWidget {
  var textEditingController = TextEditingController();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  String? phoneNumber;

  RegisterScreen3({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationCubit cubit = AuthenticationCubit.get(context);
    return BlocConsumer<AuthenticationCubit, AuthenticationStates>(
      listener: (BuildContext context, state) {
        if (state is AuthenticationUserRegisterOtpVerificationSuccessState) {
          AppCubit.get(context).changeBottomNavBar(0);
          navigateTo(
            widget: const HomeLayout(),
            context: context,
          );
        }
        if (state is AuthenticationUserRegisterOtpVerificationErrorState) {
          FocusManager.instance.primaryFocus!.unfocus();
          defaultToast(
            message: state.error.toString(),
            color: figmaErrorColor,
            context: context,
          );
        }
        if (state is AuthenticationUserResendOtpVerificationSuccessState) {
          FocusManager.instance.primaryFocus!.unfocus();
          defaultToast(
            message: cubit.otpVerificationModel!.verificationMessage!,
            color: figmaSuccessColor,
            context: context,
          );
        }
        if (state is AuthenticationUserResendOtpVerificationErrorState) {
          FocusManager.instance.primaryFocus!.unfocus();
          defaultToast(
            message: state.error.toString(),
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
          title: const Text('OTP Verification'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          'assets/images/otp-verification.svg',
                          height: 273.h,
                          width: 273.w,
                        ),
                      ),
                      SizedBox(height: 44.h),
                      Text(
                        'Verify Your Mobile',
                        style: TextStyle(
                          color: figmaOurBlack,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.sp,
                          letterSpacing: -0.165,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(height: 18.h),
                      Text(
                        'Please enter the 4 digit code sent to',
                        style: TextStyle(
                          color: figmaOurBlack,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          letterSpacing: -0.165,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        phoneNumber!,
                        style: TextStyle(
                          color: figmaOurBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          letterSpacing: -0.17,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 49.w),
                        child: PinCodeTextField(
                          appContext: context,
                          length: 4,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(6),
                            fieldHeight: 50,
                            fieldWidth: 50,
                            activeFillColor: Colors.white,
                            activeColor: figmaPrimaryBlue,
                            borderWidth: 1.0,
                            inactiveColor: const Color(0xFFE2E4E8),
                            inactiveFillColor: Colors.white,
                            selectedColor: figmaPrimaryBlue,
                            selectedFillColor: Colors.white,
                          ),
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          errorAnimationController: errorController,
                          controller: textEditingController,
                          onCompleted: (value) {
                            cubit.userRegisterOtpVerification(
                              otpVerificationCode: value,
                            );
                          },
                          onChanged: (v) {},
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Didn’t receive OTP?',
                            style: TextStyle(
                              color: const Color(0xFFA4A5A9),
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp,
                              letterSpacing: -0.165,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              cubit.userResendOtpVerification();
                            },
                            child: Text(
                              'Resend',
                              style: TextStyle(
                                color: figmaPrimaryBlue,
                                fontWeight: FontWeight.w700,
                                fontSize: 15.sp,
                                letterSpacing: -0.165,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              DefaultButton(
                height: 46.h,
                width: 344.w,
                label: 'Verify',
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
