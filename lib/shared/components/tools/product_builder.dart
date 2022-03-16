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
      child: Stack(
        children: [
          Padding(
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
                SizedBox(
                  width: 129.w,
                  height: 11.h,
                  child: Text(
                    'Pure Cocoa Powderr',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 11.sp,
                      fontStyle: FontStyle.normal,
                      letterSpacing: -0.165,
                      height: 1.11,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                SizedBox(
                  width: 91.w,
                  height: 10.h,
                  child: Text(
                    'Delicio',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: const Color(0xFF76777E),
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                      fontStyle: FontStyle.normal,
                      letterSpacing: -0.165,
                      height: 1.10,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                SizedBox(
                  width: 91.w,
                  height: 10.h,
                  child: Text(
                    'View Price',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: figmaPrimaryBlue,
                      fontWeight: FontWeight.w700,
                      fontSize: 10.sp,
                      fontStyle: FontStyle.normal,
                      letterSpacing: -0.165,
                      height: 1.10,
                    ),
                  ),
                ),
                SizedBox(height: 14.h),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: 14.h, end: 8.w),
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
            padding: EdgeInsetsDirectional.only(top: 9.h, end: 8.w),
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
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: 18.h),
              child: Container(
                width: 47.w,
                height: 27.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1C400),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24.r),
                    bottomRight: Radius.circular(24.r),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.08),
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '1% Off',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 12.sp,
                      height: 1.17,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
