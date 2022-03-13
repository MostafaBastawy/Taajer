import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/modules/authentication/login/forget_password2.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/components/tools/shared_preference/keys.dart';
import 'package:taajer/shared/components/tools/shared_preference/shared_preference.dart';
import 'package:taajer/shared/components/tools/show_toaster.dart';
import 'package:taajer/shared/patterns.dart';
import 'package:taajer/shared/styles/colors.dart';

class ForgetPassword1 extends StatelessWidget {
  String? countryFlag;
  String? countryCode;
  var phoneNumberController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String phoneValidationMessage = '';
  String? activeTextFormField;
  Color phoneNumberBorder = const Color(0xFFE2E4E8);
  List<BoxShadow> phoneNumberShadowBorder = [];

  ForgetPassword1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (CacheHelper.getData(key: countryKey) == 'Bahrain') {
      countryFlag = 'bahrain.png';
      countryCode = '+973';
    } else if (CacheHelper.getData(key: countryKey) == 'Saudi Arabia') {
      countryFlag = 'ksa-arabic.png';
      countryCode = '+966';
    } else {
      countryFlag = 'uae.png';
      countryCode = '+971';
    }
    AuthenticationCubit cubit = AuthenticationCubit.get(context);

    return BlocConsumer<AuthenticationCubit, AuthenticationStates>(
      listener: (BuildContext context, state) {
        if (state is AuthenticationForgetPasswordRequestSuccessState) {
          navigateTo(
            widget: ForgetPassword2(
              phoneNumber: phoneNumberController.text,
              countryCode: countryCode,
            ),
            context: context,
          );
          FocusManager.instance.primaryFocus!.unfocus();
          defaultToast(
            message: cubit.otpVerificationModel!.verificationMessage!,
            color: figmaSuccessColor,
            context: context,
          );
        }
        if (state is AuthenticationForgetPasswordRequestErrorState) {
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
            icon: SvgPicture.asset(
              'assets/images/arrow-left-icon.svg',
              height: 32.h,
              width: 32.w,
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
                  'Forgot Password?',
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
                  'Don’t Worry! It happens, Please enter your',
                  style: TextStyle(
                    color: const Color(0xFF76777E),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.165,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'phone number to reset your password.',
                  style: TextStyle(
                    color: const Color(0xFF76777E),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.165,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(height: 26.h),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1.0,
                          color: const Color(0xFFE2E4E8),
                        ),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage(
                              'assets/images/$countryFlag',
                            ),
                            width: 20.w,
                            height: 14.h,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10.w),
                          SizedBox(
                            height: 30.h,
                            child: Text(
                              countryCode!,
                              style: TextStyle(
                                color: const Color(0xFFCACDD5),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                height: 1.6,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1.0,
                            color: activeTextFormField == 'Phone Number'
                                ? figmaActiveColor
                                : phoneNumberBorder,
                          ),
                          borderRadius: BorderRadius.circular(6.r),
                          boxShadow: activeTextFormField == 'Phone Number'
                              ? borderActiveBoxShadow
                              : phoneNumberShadowBorder,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: phoneNumberController,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLines: 1,
                                obscureText: false,
                                onChanged: (value) {},
                                onFieldSubmitted: (value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    phoneNumberBorder = figmaErrorColor;
                                    phoneNumberShadowBorder =
                                        borderErrorBoxShadow;
                                    phoneValidationMessage =
                                        'Phone Number cant be empty';
                                  }
                                  if (value.isNotEmpty &&
                                      CacheHelper.getData(key: 'countryKey') ==
                                          'Bahrain') {
                                    if (!RegExp(bahrainPhonePattern)
                                        .hasMatch(value)) {
                                      phoneNumberBorder = figmaErrorColor;
                                      phoneNumberShadowBorder =
                                          borderErrorBoxShadow;
                                      phoneValidationMessage =
                                          'Phone Number should be 8 digits';
                                    } else {
                                      phoneNumberBorder =
                                          const Color(0xFFE2E4E8);
                                      phoneNumberShadowBorder = [];
                                      phoneValidationMessage = '';
                                    }
                                  } else if (value.isNotEmpty &&
                                      CacheHelper.getData(key: 'countryKey') ==
                                          'Saudi Arabia') {
                                    if (!RegExp(saudiPhonePattern)
                                        .hasMatch(value)) {
                                      phoneNumberBorder = figmaErrorColor;
                                      phoneNumberShadowBorder =
                                          borderErrorBoxShadow;
                                      phoneValidationMessage =
                                          'Phone Number should be 9 digits without 0';
                                    } else {
                                      phoneNumberBorder =
                                          const Color(0xFFE2E4E8);
                                      phoneNumberShadowBorder = [];
                                      phoneValidationMessage = '';
                                    }
                                  } else if (value.isNotEmpty &&
                                      CacheHelper.getData(key: 'countryKey') ==
                                          'United Arab Emirates') {
                                    if (!RegExp(emiratesPhonePattern)
                                        .hasMatch(value)) {
                                      phoneNumberBorder = figmaErrorColor;
                                      phoneNumberShadowBorder =
                                          borderErrorBoxShadow;
                                      phoneValidationMessage =
                                          'Phone Number should be 9 digits without 0';
                                    } else {
                                      phoneNumberBorder =
                                          const Color(0xFFE2E4E8);
                                      phoneNumberShadowBorder = [];
                                      phoneValidationMessage = '';
                                    }
                                  } else if (value.isEmpty) {
                                    phoneNumberBorder = figmaErrorColor;
                                    phoneNumberShadowBorder =
                                        borderErrorBoxShadow;
                                    phoneValidationMessage =
                                        'Phone Number cant be empty';
                                  }
                                },
                                onTap: () {
                                  activeTextFormField = 'Phone Number';
                                  cubit
                                      .emit(AuthenticationStatesRefreshState());
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Phone Number',
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
                            if (activeTextFormField == 'Phone Number')
                              SizedBox(width: 10.w),
                            if (activeTextFormField == 'Phone Number')
                              GestureDetector(
                                onTap: () {
                                  phoneNumberController.text = '';
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
                    ),
                  ],
                ),
                if (phoneValidationMessage.isNotEmpty) SizedBox(height: 5.5.h),
                if (phoneValidationMessage.isNotEmpty)
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/error-icon.svg'),
                      SizedBox(width: 10.w),
                      Text(
                        phoneValidationMessage,
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
                  label: 'Send Code',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.emit(AuthenticationStatesRefreshState());
                      if (phoneValidationMessage.isEmpty) {
                        cubit.passwordForgetRequest(
                          // phoneNumber: '1063136366',
                          // countryCode: '+20',
                          phoneNumber: phoneNumberController.text,
                          countryCode: countryCode!,
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
