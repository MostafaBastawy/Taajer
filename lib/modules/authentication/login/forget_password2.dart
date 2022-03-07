import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/modules/authentication/login/forget_password3.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/styles/colors.dart';

class ForgetPassword2 extends StatelessWidget {
  var otpVerificationNumber1Controller = TextEditingController();
  var otpVerificationNumber2Controller = TextEditingController();
  var otpVerificationNumber3Controller = TextEditingController();
  var otpVerificationNumber4Controller = TextEditingController();
  ForgetPassword2({Key? key}) : super(key: key);

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
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.165,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                '+973 5536 7654',
                style: TextStyle(
                  color: figmaOurBlack,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.165,
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
                      border: Border.all(
                        width: 1.0,
                        color: const Color(0xAFE2E4E8),
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: TextFormField(
                      controller: otpVerificationNumber1Controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLines: 1,
                      obscureText: false,
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {},
                      validator: (value) {},
                      onTap: () {},
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '',
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xAFB2B7C2),
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
                      border: Border.all(
                        width: 1.0,
                        color: const Color(0xAFE2E4E8),
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: TextFormField(
                      controller: otpVerificationNumber2Controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLines: 1,
                      obscureText: false,
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {},
                      validator: (value) {},
                      onTap: () {},
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '',
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xAFB2B7C2),
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
                      border: Border.all(
                        width: 1.0,
                        color: const Color(0xAFE2E4E8),
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: TextFormField(
                      controller: otpVerificationNumber3Controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLines: 1,
                      obscureText: false,
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {},
                      validator: (value) {},
                      onTap: () {},
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '',
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xAFB2B7C2),
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
                      border: Border.all(
                        width: 1.0,
                        color: const Color(0xAFE2E4E8),
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: TextFormField(
                      controller: otpVerificationNumber4Controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLines: 1,
                      obscureText: false,
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {},
                      validator: (value) {},
                      onTap: () {},
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '',
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xAFB2B7C2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
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
                    onPressed: () {},
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
                onPressed: () {
                  navigateTo(
                    widget: ForgetPassword3(),
                    context: context,
                  );
                },
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
