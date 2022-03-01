import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/modules/home_layout.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/styles/colors.dart';

class RegisterScreen3 extends StatelessWidget {
  var otpVerificationNumber1Controller = TextEditingController();
  var otpVerificationNumber2Controller = TextEditingController();
  var otpVerificationNumber3Controller = TextEditingController();
  var otpVerificationNumber4Controller = TextEditingController();
  RegisterScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationCubit cubit = AuthenticationCubit.get(context);
    return BlocBuilder<AuthenticationCubit, AuthenticationStates>(
      builder: (BuildContext context, state) => Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_sharp,
          ),
          title: const Text('OTP Verification'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
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
                  '+973 5536 7654',
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
                        border: Border.all(
                          width: 1.0,
                          color: const Color(0xFFE2E4E8),
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(6.r),
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
                        validator: (value) {},
                        onTap: () {},
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
                        border: Border.all(
                          width: 1.0,
                          color: const Color(0xFFE2E4E8),
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(6.r),
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
                        validator: (value) {},
                        onTap: () {},
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
                        border: Border.all(
                          width: 1.0,
                          color: const Color(0xFFE2E4E8),
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(6.r),
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
                        validator: (value) {},
                        onTap: () {},
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
                        border: Border.all(
                          width: 1.0,
                          color: const Color(0xFFE2E4E8),
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(6.r),
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
                        validator: (value) {},
                        onTap: () {},
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
                SizedBox(height: 50.h),
                DefaultButton(
                  height: 46.h,
                  width: 344.w,
                  label: 'Confirm & Next',
                  onPressed: () {
                    navigateTo(
                      widget: HomeLayout(),
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
      ),
    );
  }
}
