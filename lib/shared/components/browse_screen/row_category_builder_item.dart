import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowCategoryBuilderItem extends StatelessWidget {
  const RowCategoryBuilderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 26.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFF8C93A3),
          width: 1.0,
        ),
      ),
      child: Text(
        'All',
        style: TextStyle(
          color: const Color(0xFF8C93A3),
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          height: 1.60,
        ),
      ),
    );
  }
}
