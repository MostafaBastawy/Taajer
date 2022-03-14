import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/modules/authentication/login/forget_password3.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/components/tools/show_toaster.dart';
import 'package:taajer/shared/styles/colors.dart';

class ForgetPassword2 extends StatelessWidget {
  String? phoneNumber;
  String? countryCode;
  var textEditingController = TextEditingController();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  ForgetPassword2({
    Key? key,
    required this.phoneNumber,
    required this.countryCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationCubit cubit = AuthenticationCubit.get(context);

    return BlocConsumer<AuthenticationCubit, AuthenticationStates>(
      listener: (BuildContext context, state) {
        if (state
            is AuthenticationUserForgetPasswordOtpVerificationSuccessState) {
          navigateTo(
            widget: ForgetPassword3(),
            context: context,
          );
        }
        if (state
            is AuthenticationUserForgetPasswordOtpVerificationErrorState) {
          FocusManager.instance.primaryFocus!.unfocus();
          defaultToast(
            message: state.error.toString(),
            color: figmaSuccessColor,
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
            icon: SvgPicture.asset(
              'assets/images/arrow-left-icon.svg',
              height: 32.h,
              width: 32.w,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter OTP',
                style: TextStyle(
                  color: figmaOurBlack,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.165,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Please enter the 4 digit code sent to',
                style: TextStyle(
                  color: figmaOurBlack,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.165,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                '$countryCode$phoneNumber',
                style: TextStyle(
                  color: figmaOurBlack,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.165,
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 49.w),
                child: PinCodeTextField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                    cubit.userForgetPasswordOtpVerification(
                      otpVerificationNumber: value,
                    );
                  },
                  onChanged: (v) {},
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn’t receive OTP?',
                    style: TextStyle(
                      color: const Color(0xFFA4A5A9),
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                      letterSpacing: -0.165,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      cubit.userForgetPasswordResendOtpVerification(
                        phoneNumber: phoneNumber!,
                        countryCode: countryCode!,
                        // phoneNumber: '1063136366',
                        // countryCode: '+20',
                      );
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
              const Spacer(),
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
