import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/styles/colors.dart';

class LoginScreen1 extends StatelessWidget {
  var emailOrPhoneController = TextEditingController();
  LoginScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_sharp,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: TextStyle(
                color: primaryBlack,
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.165,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Please sign in to your account',
              style: TextStyle(
                color: const Color(0xAF76777E),
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
                border: Border.all(
                  width: 1.0,
                  color: const Color(0xAFE2E4E8),
                ),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: TextFormField(
                controller: emailOrPhoneController,
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                obscureText: false,
                onChanged: (value) {},
                onFieldSubmitted: (value) {},
                validator: (value) {},
                onTap: () {},
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email or Phone',
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFB2B7C2),
                  ),
                ),
              ),
            ),
            SizedBox(height: 14.h),
            Row(
              children: [
                const Spacer(),
                Text(
                  'Forgot Email?',
                  style: TextStyle(
                    color: primaryBlue,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.165,
                  ),
                ),
              ],
            ),
            const Spacer(),
            DefaultButton(
              height: 46.h,
              width: 344.w,
              label: 'Next',
              onPressed: () {},
              labelColor: Colors.white,
              labelWeight: FontWeight.w700,
              backGroundColor: primaryBlue,
            ),
          ],
        ),
      ),
    );
  }
}
