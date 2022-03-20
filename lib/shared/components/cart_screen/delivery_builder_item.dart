import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/shared/styles/colors.dart';

class DeliveryBuilderItem extends StatelessWidget {
  const DeliveryBuilderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Supplier #101',
          style: TextStyle(
            color: figmaOurBlack,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            fontSize: 15.sp,
          ),
        ),
        SizedBox(height: 11.65.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          width: 343.w,
          height: 69.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(color: const Color(0xFFE2E4E8), width: 1.0),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/cart_screen/truck-icon.svg',
                width: 28.w,
                height: 28.h,
              ),
              SizedBox(width: 19.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tomorrow',
                    style: TextStyle(
                      color: figmaShade1,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    width: 148.w,
                    height: 26.h,
                    child: Text(
                      '28th February 2022 Between 6:00 AM to 5:00 PM',
                      style: TextStyle(
                        color: const Color(0xFFB2B7C2),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 10.sp,
                        height: 1.25,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Change',
                  style: TextStyle(
                    color: figmaPrimaryBlue,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
