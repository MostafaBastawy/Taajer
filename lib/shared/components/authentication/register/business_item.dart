import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BusinessItemBuilder extends StatelessWidget {
  String? businessImage;
  String? businessType;
  String? businessDescription;
  BusinessItemBuilder({
    Key? key,
    required this.businessImage,
    required this.businessType,
    required this.businessDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 343.w,
      height: 107.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: const Color(0xAFE2E4E8),
          width: 1.0,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SvgPicture.asset(
            businessImage!,
            width: 150.w,
            height: 87.h,
          ),
          SizedBox(width: 20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                businessType!,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                  color: const Color(0xAF1B1D28),
                  letterSpacing: -0.165,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                businessDescription!,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: const Color(0xAF1B1D28),
                  letterSpacing: -0.165,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.check_circle,
            size: 26,
            color: Color(0xAFDEE6EE),
          ),
        ],
      ),
    );
  }
}
