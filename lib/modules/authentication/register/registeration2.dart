import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        if (state is AuthenticationRegisterStep1SuccessState) {
          if (cubit.registerStep1Model!.registerResult!) {
            navigateTo(
              widget: RegisterScreen3(),
              context: context,
            );
          } else {
            defaultToast(
              message: cubit.registerStep1Model!.registerMessage!,
              color: figmaErrorColor,
              context: context,
            );
          }
        }
        if (state is AuthenticationRegisterStep1ErrorState) {
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
                  child: TextFormField(
                    controller: businessNameController,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    obscureText: false,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        businessNameShadowBorder = borderErrorBoxShadow;
                        businessNameBorder = figmaErrorColor;
                      }
                    },
                    onTap: () {
                      activeTextFormField = 'Business Name';
                      cubit.emit(AuthenticationStatesRefreshState());
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
                        emailAddressShadowBorder = borderErrorBoxShadow;
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
                SizedBox(height: 14.h),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      width: 104.w,
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      width: 227.w,
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
                            phoneNumberShadowBorder = borderErrorBoxShadow;
                          }
                        },
                        onTap: () {
                          activeTextFormField = 'Phone Number';
                          cubit.emit(AuthenticationStatesRefreshState());
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
                              passwordShadowBorder = borderErrorBoxShadow;
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
                            }
                          },
                          onTap: () {
                            activeTextFormField = 'Confirm Password';
                            cubit.emit(AuthenticationStatesRefreshState());
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
                  label: 'Confirm & Next',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.emit(AuthenticationStatesRefreshState());
                      if (businessNameController.text.isNotEmpty &&
                          emailAddressController.text.isNotEmpty &
                              phoneNumberController.text.isNotEmpty &
                              passwordController.text.isNotEmpty &
                              confirmPasswordController.text.isNotEmpty) {
                        cubit.registerStep1(
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
