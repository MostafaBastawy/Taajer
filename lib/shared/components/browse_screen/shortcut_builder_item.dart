import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShortcutBuilderItem extends StatelessWidget {
  String? shortcutImage;
  String? shortcutName;
  ShortcutBuilderItem({
    Key? key,
    required this.shortcutImage,
    required this.shortcutName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 55.w,
          height: 55.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1.0,
              color: const Color(0xFFE2E4E8),
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              shortcutImage!,
              width: 30.w,
              height: 30.h,
              color: const Color(0xFF3A4662),
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          shortcutName!,
          style: TextStyle(
            color: const Color(0xFF3A4662),
            fontWeight: FontWeight.w600,
            fontSize: 13.sp,
            fontStyle: FontStyle.normal,
          ),
        ),
      ],
    );
  }
}
