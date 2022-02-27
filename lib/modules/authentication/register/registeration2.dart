import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/styles/colors.dart';

class RegisterScreen2 extends StatelessWidget {
  var businessNameController = TextEditingController();
  var emailAddressController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  RegisterScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationCubit cubit = AuthenticationCubit.get(context);
    return BlocBuilder<AuthenticationCubit, AuthenticationStates>(
      builder: (BuildContext context, state) => Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_sharp,
          ),
          title: const Text('Registration'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  width: 343.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: const Color(0xAFE2E4E8),
                    ),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: TextFormField(
                    controller: businessNameController,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    obscureText: false,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                    validator: (value) {},
                    onTap: () {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Business Name',
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xAFB2B7C2),
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
                    border: Border.all(
                      width: 1.0,
                      color: const Color(0xAFE2E4E8),
                    ),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: TextFormField(
                    controller: emailAddressController,
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    obscureText: false,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                    validator: (value) {},
                    onTap: () {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email Address',
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xAFB2B7C2),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 14.h),
                Row(
                  children: [],
                ),
                SizedBox(height: 14.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  width: 343.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: const Color(0xAFE2E4E8),
                    ),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    maxLines: 1,
                    obscureText: cubit.isPasswordShown,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                    validator: (value) {},
                    onTap: () {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xAFB2B7C2),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          cubit.changePasswordVisibility();
                        },
                        icon: Icon(cubit.passwordSuffixIcon),
                        color: const Color(0xAFE2E4E8),
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
                    border: Border.all(
                      width: 1.0,
                      color: const Color(0xAFE2E4E8),
                    ),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: TextFormField(
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    maxLines: 1,
                    obscureText: cubit.isPasswordShown,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                    validator: (value) {},
                    onTap: () {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xAFB2B7C2),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          cubit.changePasswordVisibility();
                        },
                        icon: Icon(cubit.passwordSuffixIcon),
                        color: const Color(0xAFE2E4E8),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 200.h),
                DefaultButton(
                  height: 46.h,
                  width: 344.w,
                  label: 'Confirm & Next',
                  onPressed: () {},
                  labelColor: Colors.white,
                  labelWeight: FontWeight.w700,
                  backGroundColor: primaryBlue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
