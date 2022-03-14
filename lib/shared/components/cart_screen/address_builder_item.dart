import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/shared/styles/colors.dart';

class AddressBuilderItem extends StatelessWidget {
  const AddressBuilderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 90.h,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          width: 1.0,
          color: const Color(0xFFE2E4E8),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Starbucks',
                style: TextStyle(
                  color: figmaOurBlack,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                'Seef District',
                style: TextStyle(
                  color: const Color(0xFFF57D53),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 1.h),
              SizedBox(
                width: 114.w,
                height: 26.h,
                child: Text(
                  'Shop 33, Building 1066 Road 1215, Block 112',
                  style: TextStyle(
                    color: const Color(0xFF747C90),
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
          SvgPicture.asset(
            'assets/images/check-circle.svg',
            width: 32.w,
            height: 32.h,
            color: figmaGrey2,
          ),
        ],
      ),
    );
  }
}
