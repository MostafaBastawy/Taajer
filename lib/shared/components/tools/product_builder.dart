import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/shared/styles/colors.dart';

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 188.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(width: 1.0, color: figmaGrey1),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image(
                image: const AssetImage('assets/images/product-item.png'),
                height: 101.h,
                width: 101.w,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Pure Cocoa Powder',
              style: TextStyle(
                color: figmaOurBlack,
                fontWeight: FontWeight.w700,
                fontSize: 11.sp,
                fontStyle: FontStyle.normal,
                letterSpacing: -0.165,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              'Delicio',
              style: TextStyle(
                color: const Color(0xFF76777E),
                fontWeight: FontWeight.w600,
                fontSize: 10.sp,
                fontStyle: FontStyle.normal,
                letterSpacing: -0.165,
              ),
            ),
            SizedBox(height: 6.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'View Price',
                  style: TextStyle(
                    color: figmaPrimaryBlue,
                    fontWeight: FontWeight.w700,
                    fontSize: 10.sp,
                    fontStyle: FontStyle.normal,
                    letterSpacing: -0.165,
                  ),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/star-icon.svg',
                      width: 12.w,
                      height: 12.h,
                    ),
                    SizedBox(height: 2.w),
                  ],
                ),
                SizedBox(width: 2.h),
                Text(
                  '4.5',
                  style: TextStyle(
                    color: figmaOurBlack,
                    fontWeight: FontWeight.w600,
                    fontSize: 10.sp,
                    fontStyle: FontStyle.normal,
                    letterSpacing: -0.165,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
          ],
        ),
      ),
    );
  }
}
