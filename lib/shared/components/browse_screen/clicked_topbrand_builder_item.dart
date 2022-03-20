import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/shared/styles/colors.dart';

class ClickedTopBrandBuilderItem extends StatelessWidget {
  const ClickedTopBrandBuilderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      width: 343.w,
      height: 106.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          width: 1.0,
          style: BorderStyle.solid,
          color: figmaGrey1,
        ),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: 86.w,
                height: 86.h,
                child: const Image(
                  image: AssetImage(
                    'assets/images/browse_screen/cola.png',
                  ),
                ),
              ),
              SizedBox(width: 7.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6.h),
                  Text(
                    'Product Name',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: figmaShade1,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    'Brand Name',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: const Color(0xFF76777E),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'BHD 999.000',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: figmaPrimaryBlue,
                    ),
                  ),
                  SizedBox(height: 5.h),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: 5.h, end: 5.w),
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: SvgPicture.asset(
                'assets/images/browse_screen/plus-button-icon.svg',
                width: 22.w,
                height: 22.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 5.h, end: 5.w),
            child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: SvgPicture.asset(
                'assets/images/bottom_nav_bar/nav-item2.svg',
                width: 18.w,
                height: 18.h,
                color: const Color(0xFFB2B7C2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
