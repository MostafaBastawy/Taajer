import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderShortDetailsBuilderItem extends StatelessWidget {
  String? icon;
  String? value;
  OrderShortDetailsBuilderItem({
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
        SizedBox(width: 7.w),
        SizedBox(
          width: 103.w,
          height: 18.h,
          child: Text(
            value!,
            style: TextStyle(
              color: const Color(0xFFB2B7C2),
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              height: 1.18,
            ),
          ),
        ),
      ],
    );
  }
}
