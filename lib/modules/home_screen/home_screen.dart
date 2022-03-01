import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/shared/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  width: 343.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: const Color(0xFFE2E4E8),
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'What are you looking for?',
                        style: TextStyle(
                          color: const Color(0xFFB2B7C2),
                          fontStyle: FontStyle.normal,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/images/search-icon.svg',
                        height: 15.h,
                        width: 15.w,
                        color: figmaOurBlack,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                width: 343.w,
                height: 46.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF5CE),
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFFFFAD0D),
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/warning-icon.svg',
                      height: 17.h,
                      width: 17.w,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      'Complete Registration',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFFFAD0D),
                        fontStyle: FontStyle.normal,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
