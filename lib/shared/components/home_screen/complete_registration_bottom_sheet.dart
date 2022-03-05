import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/styles/colors.dart';

class CompleteRegistrationBottomSheet extends StatelessWidget {
  const CompleteRegistrationBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.r),
        topRight: Radius.circular(30.r),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        width: 375.w,
        height: 525.h,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/group1208.svg',
              height: 204.91,
              width: 275.w,
            ),
            SizedBox(height: 38.9.h),
            SizedBox(
              height: 46.h,
              width: 296.w,
              child: Text(
                'Would you like to complete your registration?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: figmaOurBlack,
                  fontStyle: FontStyle.normal,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.25,
                ),
              ),
            ),
            SizedBox(height: 31.h),
            SizedBox(
              height: 40.h,
              width: 343.w,
              child: Text(
                'Complete registration and verify your account to speed up your ordering process.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF49536E),
                  fontStyle: FontStyle.normal,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.165,
                  height: 1.2,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            DefaultButton(
              height: 46.h,
              width: 341.w,
              label: 'Complete Registration',
              onPressed: () {},
              labelColor: Colors.white,
              labelWeight: FontWeight.w700,
              backGroundColor: figmaPrimaryBlue,
            ),
            SizedBox(height: 24.h),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Continue Browsing',
                style: TextStyle(
                  color: const Color(0xFFA4A5A9),
                  fontStyle: FontStyle.normal,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
