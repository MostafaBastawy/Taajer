import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/shared/styles/colors.dart';

class BusinessItemBuilder extends StatelessWidget {
  String? businessImage;
  String? businessType;
  String? businessDescription;
  Color borderColor = figmaGrey1;
  BusinessItemBuilder({
    Key? key,
    required this.businessImage,
    required this.businessType,
    required this.businessDescription,
    required this.borderColor,
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
          color: borderColor,
          width: 1.0,
          style: BorderStyle.solid,
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
                  color: figmaOurBlack,
                  letterSpacing: -0.165,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                businessDescription!,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: figmaOurBlack,
                  letterSpacing: -0.165,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          const Spacer(),
          SvgPicture.asset(
            'assets/images/check-circle.svg',
            height: 26.h,
            width: 26.w,
            color: borderColor,
          ),
        ],
      ),
    );
  }
}
