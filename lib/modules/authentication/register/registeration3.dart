import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/app_cubit/app_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/modules/home_layout.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/components/tools/show_toaster.dart';
import 'package:taajer/shared/styles/colors.dart';

class RegisterScreen3 extends StatelessWidget {
  var otpVerificationNumber1Controller = TextEditingController();
  var otpVerificationNumber2Controller = TextEditingController();
  var otpVerificationNumber3Controller = TextEditingController();
  var otpVerificationNumber4Controller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? activeTextFormField;
  Color otpVerificationNumber1Border = const Color(0xFFE2E4E8);
  Color otpVerificationNumber2Border = const Color(0xFFE2E4E8);
  Color otpVerificationNumber3Border = const Color(0xFFE2E4E8);
  Color otpVerificationNumber4Border = const Color(0xFFE2E4E8);
  List<BoxShadow> otpVerificationNumber1ShadowBorder = [];
  List<BoxShadow> otpVerificationNumber2ShadowBorder = [];
  List<BoxShadow> otpVerificationNumber3ShadowBorder = [];
  List<BoxShadow> otpVerificationNumber4ShadowBorder = [];
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
          if (cubit.otpVerificationModel!.verificationResult!) {
            AppCubit.get(context).changeBottomNavBar(0);
            navigateTo(
              widget: const HomeLayout(),
              context: context,
            );
          } else {
            defaultToast(
              message: cubit.otpVerificationModel!.verificationMessage!,
              color: figmaErrorColor,
              context: context,
            );
          }
        }
        if (state is AuthenticationUserRegisterOtpVerificationErrorState) {
          defaultToast(
            message: state.error.toString(),
            color: figmaErrorColor,
            context: context,
          );
        }
        if (state is AuthenticationUserResendOtpVerificationSuccessState) {
          if (cubit.otpVerificationModel!.verificationResult!) {
            defaultToast(
              message: cubit.otpVerificationModel!.verificationMessage!,
              color: figmaSuccessColor,
              context: context,
            );
          }
        }
        if (state is AuthenticationUserResendOtpVerificationErrorState) {
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
          child: Form(
            key: formKey,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              width: 50.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 1.0,
                                  color: otpVerificationNumber1Controller
                                          .text.isNotEmpty
                                      ? figmaActiveColor
                                      : otpVerificationNumber1Border,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(6.r),
                                boxShadow: otpVerificationNumber1Controller
                                        .text.isNotEmpty
                                    ? borderActiveBoxShadow
                                    : otpVerificationNumber1ShadowBorder,
                              ),
                              child: TextFormField(
                                controller: otpVerificationNumber1Controller,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLines: 1,
                                obscureText: false,
                                onChanged: (value) {},
                                onFieldSubmitted: (value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    otpVerificationNumber1Border =
                                        figmaErrorColor;
                                    otpVerificationNumber1ShadowBorder =
                                        borderErrorBoxShadow;
                                  }
                                },
                                onTap: () {
                                  cubit
                                      .emit(AuthenticationStatesRefreshState());
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '',
                                  hintStyle: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFFB2B7C2),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              width: 50.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 1.0,
                                  color: otpVerificationNumber2Controller
                                          .text.isNotEmpty
                                      ? figmaActiveColor
                                      : otpVerificationNumber2Border,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(6.r),
                                boxShadow: otpVerificationNumber2Controller
                                        .text.isNotEmpty
                                    ? borderActiveBoxShadow
                                    : otpVerificationNumber2ShadowBorder,
                              ),
                              child: TextFormField(
                                controller: otpVerificationNumber2Controller,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLines: 1,
                                obscureText: false,
                                onChanged: (value) {},
                                onFieldSubmitted: (value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    otpVerificationNumber2Border =
                                        figmaErrorColor;
                                    otpVerificationNumber2ShadowBorder =
                                        borderErrorBoxShadow;
                                  }
                                },
                                onTap: () {
                                  cubit
                                      .emit(AuthenticationStatesRefreshState());
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '',
                                  hintStyle: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFFB2B7C2),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              width: 50.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 1.0,
                                  color: otpVerificationNumber3Controller
                                          .text.isNotEmpty
                                      ? figmaActiveColor
                                      : otpVerificationNumber3Border,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(6.r),
                                boxShadow: otpVerificationNumber3Controller
                                        .text.isNotEmpty
                                    ? borderActiveBoxShadow
                                    : otpVerificationNumber3ShadowBorder,
                              ),
                              child: TextFormField(
                                controller: otpVerificationNumber3Controller,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLines: 1,
                                obscureText: false,
                                onChanged: (value) {},
                                onFieldSubmitted: (value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    otpVerificationNumber3Border =
                                        figmaErrorColor;
                                    otpVerificationNumber3ShadowBorder =
                                        borderErrorBoxShadow;
                                  }
                                },
                                onTap: () {
                                  cubit
                                      .emit(AuthenticationStatesRefreshState());
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '',
                                  hintStyle: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFFB2B7C2),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              width: 50.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 1.0,
                                  color: otpVerificationNumber4Controller
                                          .text.isNotEmpty
                                      ? figmaActiveColor
                                      : otpVerificationNumber4Border,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(6.r),
                                boxShadow: otpVerificationNumber4Controller
                                        .text.isNotEmpty
                                    ? borderActiveBoxShadow
                                    : otpVerificationNumber4ShadowBorder,
                              ),
                              child: TextFormField(
                                controller: otpVerificationNumber4Controller,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLines: 1,
                                obscureText: false,
                                onChanged: (value) {},
                                onFieldSubmitted: (value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    otpVerificationNumber4Border =
                                        figmaErrorColor;
                                    otpVerificationNumber4ShadowBorder =
                                        borderErrorBoxShadow;
                                  }
                                },
                                onTap: () {
                                  cubit
                                      .emit(AuthenticationStatesRefreshState());
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '',
                                  hintStyle: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFFB2B7C2),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.emit(AuthenticationStatesRefreshState());
                      if (otpVerificationNumber1Controller.text.isNotEmpty &&
                          otpVerificationNumber2Controller.text.isNotEmpty &&
                          otpVerificationNumber3Controller.text.isNotEmpty &&
                          otpVerificationNumber4Controller.text.isNotEmpty) {
                        cubit.userRegisterOtpVerification(
                          verificationCode1:
                              otpVerificationNumber1Controller.text,
                          verificationCode2:
                              otpVerificationNumber2Controller.text,
                          verificationCode3:
                              otpVerificationNumber3Controller.text,
                          verificationCode4:
                              otpVerificationNumber4Controller.text,
                        );
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
