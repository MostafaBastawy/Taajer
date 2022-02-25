import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageCountryItemBuilder extends StatelessWidget {
  String? image;
  String? text;
  IconData? icon;
  LanguageCountryItemBuilder({
    Key? key,
    required this.image,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344.w,
      height: 46.h,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: const Color(0xAFCDD5E1)),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        children: [
          Image(
            width: 33.27.w,
            height: 17.16.h,
            image: AssetImage(image!),
          ),
          // SvgPicture.asset(
          //   image!,
          //   width: 33.27.w,
          //   height: 17.16.h,
          // ),
          SizedBox(width: 24.37.w),
          Text(
            text!,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xAF000000),
            ),
          ),
          const Spacer(),
          Icon(
            icon,
            size: 26,
            color: const Color(0xAFDEE6EE),
          ),
        ],
      ),
    );
  }
}
