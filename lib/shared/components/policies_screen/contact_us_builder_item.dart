import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/shared/styles/colors.dart';

class ContactUsBuilderItem extends StatelessWidget {
  String? icon;
  String? value;
  ContactUsBuilderItem({
    Key? key,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon!,
          width: 20.w,
          height: 20.h,
        ),
        SizedBox(width: 8.w),
        SizedBox(
          height: 18.h,
          child: Text(
            value!,
            style: TextStyle(
              color: figmaPrimaryBlue,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 13.sp,
              height: 1.18,
            ),
          ),
        ),
      ],
    );
  }
}
