import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreenBuilderItem extends StatelessWidget {
  String? itemIcon;
  String? itemTitle;
  String? itemValue;
  ProfileScreenBuilderItem({
    Key? key,
    required this.itemIcon,
    required this.itemTitle,
    required this.itemValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      width: 342.w,
      height: 40.h,
      child: Row(
        children: [
          SvgPicture.asset(
            itemIcon!,
            width: 22.w,
            height: 22.h,
          ),
          SizedBox(width: 12.w),
          Text(
            itemTitle!,
            style: TextStyle(
              color: const Color(0xFF525C76),
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14.sp,
            ),
          ),
          const Spacer(),
          Text(
            itemValue!,
            style: TextStyle(
              color: const Color(0xFFB2B7C2),
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
