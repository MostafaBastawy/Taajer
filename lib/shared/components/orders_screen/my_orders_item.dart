import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/shared/styles/colors.dart';

class MyOrdersBuilderItem extends StatelessWidget {
  const MyOrdersBuilderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
      width: 343.w,
      height: 146.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: const Color(0xFFE2E4E8), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Supplier #101',
            style: TextStyle(
              color: figmaOurBlack,
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/orders_screen/check-icon.svg',
                        width: 12.w,
                        height: 12.h,
                      ),
                      SizedBox(width: 7.w),
                      Text(
                        'Delivered',
                        style: TextStyle(
                          color: const Color(0xFF2D9017),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    '17 Feburary 2022   17:31',
                    style: TextStyle(
                      color: const Color(0xFF747C90),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SvgPicture.asset(
                'assets/images/orders_screen/arrow-icon.svg',
                width: 24.w,
                height: 24.h,
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Text(
            'Order ID: #8E7D33',
            style: TextStyle(
              color: const Color(0xFF747C90),
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(height: 19.h),
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/orders_screen/reorder-icon.svg',
                width: 20.w,
                height: 20.h,
              ),
              SizedBox(width: 10.w),
              Text(
                'Re-order',
                style: TextStyle(
                  color: figmaPrimaryBlue,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                'assets/images/orders_screen/rate-icon.svg',
                width: 20.w,
                height: 20.h,
              ),
              SizedBox(width: 10.w),
              Text(
                'Rate Order',
                style: TextStyle(
                  color: figmaPrimaryBlue,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
