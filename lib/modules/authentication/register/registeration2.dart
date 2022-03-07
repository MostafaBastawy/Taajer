import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/modules/authentication/register/registeration3.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/components/tools/shared_preference/keys.dart';
import 'package:taajer/shared/components/tools/shared_preference/shared_preference.dart';
import 'package:taajer/shared/components/tools/show_toaster.dart';
import 'package:taajer/shared/styles/colors.dart';

class RegisterScreen2 extends StatelessWidget {
  var businessNameController = TextEditingController();
  var emailAddressController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? countryFlag;
  String? countryCode;
  String? activeTextFormField;
  String businessNameValidationMessage = '';
  String emailValidationMessage = '';
  String phoneValidationMessage = '';
  String passwordValidationMessage = '';
  String confirmPasswordValidationMessage = '';
  String emailPattern = r'\w+@\w+\.\w+';
  String saudiPhonePattern = r'^((?!(0))[0-9]{9})$';
  String bahrainPhonePattern = r'^((?!(0))[0-9]{8})$';
  String emiratesPhonePattern = r'^((?!(0))[0-9]{9})$';

  Color businessNameBorder = const Color(0xFFE2E4E8);
  Color emailAddressBorder = const Color(0xFFE2E4E8);
  Color phoneNumberBorder = const Color(0xFFE2E4E8);
  Color passwordBorder = const Color(0xFFE2E4E8);
  Color confirmPasswordBorder = const Color(0xFFE2E4E8);
  List<BoxShadow> businessNameShadowBorder = [];
  List<BoxShadow> emailAddressShadowBorder = [];
  List<BoxShadow> phoneNumberShadowBorder = [];
  List<BoxShadow> passwordShadowBorder = [];
  List<BoxShadow> confirmPasswordShadowBorder = [];

  RegisterScreen2({Key? key}) : super(key: key);

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
        if (state is AuthenticationUserRegisterSuccessState) {
          navigateTo(
            widget: RegisterScreen3(
                phoneNumber: '$countryCode ${phoneNumberController.text}'),
            context: context,
          );
        }
        if (state is AuthenticationUserRegisterErrorState) {
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
          title: const Text('Registration'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          width: 343.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1.0,
                              color: activeTextFormField == 'Business Name'
                                  ? figmaActiveColor
                                  : businessNameBorder,
                            ),
                            borderRadius: BorderRadius.circular(6.r),
                            boxShadow: activeTextFormField == 'Business Name'
                                ? borderActiveBoxShadow
                                : businessNameShadowBorder,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: businessNameController,
                                  keyboardType: TextInputType.text,
                                  maxLines: 1,
                                  obscureText: false,
                                  onChanged: (value) {},
                                  onFieldSubmitted: (value) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      businessNameShadowBorder =
                                          borderErrorBoxShadow;
                                      businessNameBorder = figmaErrorColor;
                                      businessNameValidationMessage =
                                          'Business Name cant be empty';
                                    } else {
                                      businessNameBorder =
                                          const Color(0xFFE2E4E8);
                                      businessNameShadowBorder = [];

                                      businessNameValidationMessage = '';
                                    }
                                  },
                                  onTap: () {
                                    activeTextFormField = 'Business Name';
                                    cubit.emit(
                                        AuthenticationStatesRefreshState());
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Business Name',
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
                              if (activeTextFormField == 'Business Name')
                                GestureDetector(
                                  onTap: () {
                                    businessNameController.text = '';
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
                        if (businessNameValidationMessage.isNotEmpty)
                          SizedBox(height: 5.5.h),
                        if (businessNameValidationMessage.isNotEmpty)
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/error-icon.svg'),
                              SizedBox(width: 10.w),
                              Text(
                                businessNameValidationMessage,
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
                                  : emailAddressBorder,
                            ),
                            borderRadius: BorderRadius.circular(6.r),
                            boxShadow: activeTextFormField == 'Email Address'
                                ? borderActiveBoxShadow
                                : emailAddressShadowBorder,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: emailAddressController,
                                  keyboardType: TextInputType.emailAddress,
                                  maxLines: 1,
                                  obscureText: false,
                                  onChanged: (value) {},
                                  onFieldSubmitted: (value) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      emailAddressBorder = figmaErrorColor;
                                      emailAddressShadowBorder =
                                          borderErrorBoxShadow;
                                      emailValidationMessage =
                                          'Email Address cant be empty';
                                    } else if (!RegExp(emailPattern)
                                        .hasMatch(value)) {
                                      emailAddressBorder = figmaErrorColor;
                                      emailAddressShadowBorder =
                                          borderErrorBoxShadow;
                                      emailValidationMessage =
                                          'Invalid email address format';
                                    } else {
                                      emailAddressBorder =
                                          const Color(0xFFE2E4E8);
                                      emailAddressShadowBorder = [];
                                      emailValidationMessage = '';
                                    }
                                  },
                                  onTap: () {
                                    activeTextFormField = 'Email Address';
                                    cubit.emit(
                                        AuthenticationStatesRefreshState());
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
                                    emailAddressController.text = '';
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
                        if (emailValidationMessage.isNotEmpty)
                          SizedBox(height: 5.5.h),
                        if (emailValidationMessage.isNotEmpty)
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/error-icon.svg'),
                              SizedBox(width: 10.w),
                              Text(
                                emailValidationMessage,
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
                                  boxShadow:
                                      activeTextFormField == 'Phone Number'
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
                                              CacheHelper.getData(
                                                      key: 'countryKey') ==
                                                  'Bahrain') {
                                            if (!RegExp(bahrainPhonePattern)
                                                .hasMatch(value)) {
                                              phoneNumberBorder =
                                                  figmaErrorColor;
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
                                              CacheHelper.getData(
                                                      key: 'countryKey') ==
                                                  'Saudi Arabia') {
                                            if (!RegExp(saudiPhonePattern)
                                                .hasMatch(value)) {
                                              phoneNumberBorder =
                                                  figmaErrorColor;
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
                                              CacheHelper.getData(
                                                      key: 'countryKey') ==
                                                  'United Arab Emirates') {
                                            if (!RegExp(emiratesPhonePattern)
                                                .hasMatch(value)) {
                                              phoneNumberBorder =
                                                  figmaErrorColor;
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
                                          cubit.emit(
                                              AuthenticationStatesRefreshState());
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
                        if (phoneValidationMessage.isNotEmpty)
                          SizedBox(height: 5.5.h),
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
                        SizedBox(height: 14.h),
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
                                      passwordShadowBorder =
                                          borderErrorBoxShadow;
                                      passwordValidationMessage =
                                          'Password cant be empty';
                                    } else {
                                      passwordBorder = const Color(0xFFE2E4E8);
                                      passwordShadowBorder = [];
                                      passwordValidationMessage = '';
                                    }
                                  },
                                  onTap: () {
                                    activeTextFormField = 'Password';
                                    cubit.emit(
                                        AuthenticationStatesRefreshState());
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
                        if (passwordValidationMessage.isNotEmpty)
                          SizedBox(height: 5.5.h),
                        if (passwordValidationMessage.isNotEmpty)
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/error-icon.svg'),
                              SizedBox(width: 10.w),
                              Text(
                                passwordValidationMessage,
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
                        Container(
                          padding: EdgeInsetsDirectional.only(start: 16.w),
                          width: 343.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1.0,
                              color: activeTextFormField == 'Confirm Password'
                                  ? figmaActiveColor
                                  : confirmPasswordBorder,
                            ),
                            borderRadius: BorderRadius.circular(6.r),
                            boxShadow: activeTextFormField == 'Confirm Password'
                                ? borderActiveBoxShadow
                                : confirmPasswordShadowBorder,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: confirmPasswordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  maxLines: 1,
                                  obscureText: cubit.obscureText,
                                  onChanged: (value) {},
                                  onFieldSubmitted: (value) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      confirmPasswordBorder = figmaErrorColor;
                                      confirmPasswordShadowBorder =
                                          borderErrorBoxShadow;
                                      confirmPasswordValidationMessage =
                                          'Confirm Password cant be empty';
                                    } else if (confirmPasswordController.text !=
                                        passwordController.text) {
                                      confirmPasswordBorder = figmaErrorColor;
                                      confirmPasswordShadowBorder =
                                          borderErrorBoxShadow;
                                      confirmPasswordValidationMessage =
                                          'Confirm Password is not match';
                                    } else {
                                      confirmPasswordBorder =
                                          const Color(0xFFE2E4E8);
                                      confirmPasswordShadowBorder = [];
                                      confirmPasswordValidationMessage = '';
                                    }
                                  },
                                  onTap: () {
                                    activeTextFormField = 'Confirm Password';
                                    cubit.emit(
                                        AuthenticationStatesRefreshState());
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Confirm Password',
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
                              if (activeTextFormField == 'Confirm Password')
                                SizedBox(width: 10.w),
                              if (activeTextFormField == 'Confirm Password')
                                GestureDetector(
                                  onTap: () {
                                    confirmPasswordController.text = '';
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/delete-icon.svg',
                                    width: 16.67.w,
                                    height: 16.67.h,
                                  ),
                                ),
                              if (activeTextFormField == 'Confirm Password')
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
                        if (confirmPasswordValidationMessage.isNotEmpty)
                          SizedBox(height: 5.5.h),
                        if (confirmPasswordValidationMessage.isNotEmpty)
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/error-icon.svg'),
                              SizedBox(width: 10.w),
                              Text(
                                confirmPasswordValidationMessage,
                                style: TextStyle(
                                  color: const Color(0xFFFF3236),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp,
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
                  label: 'Confirm & Next',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.emit(AuthenticationStatesRefreshState());
                      if (businessNameController.text.isNotEmpty &&
                          emailAddressController.text.isNotEmpty &&
                          phoneNumberController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty &&
                          confirmPasswordController.text
                              .contains(passwordController.text)) {
                        cubit.userRegister(
                          email: emailAddressController.text,
                          password: confirmPasswordController.text,
                          phone: phoneNumberController.text,
                          name: businessNameController.text,
                          phoneCode: countryCode!,
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
