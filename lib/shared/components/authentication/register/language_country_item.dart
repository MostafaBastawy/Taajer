import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/shared/styles/colors.dart';

class LanguageCountryItemBuilder extends StatelessWidget {
  String? image;
  String? text;
  String? fontFamily;
  double? fontHeight = 1.6;

  LanguageCountryItemBuilder({
    Key? key,
    required this.image,
    required this.text,
    this.fontHeight,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344.w,
      height: 46.h,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: figmaGrey1,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        children: [
          Image(
            width: 33.27.w,
            height: 17.16.h,
            image: AssetImage(image!),
          ),
          SizedBox(width: 24.37.w),
          Text(
            text!,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: figmaOurBlack,
              fontFamily: fontFamily,
              fontStyle: FontStyle.normal,
              height: fontHeight,
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            'assets/images/check-circle.svg',
            height: 26.h,
            width: 26.w,
            color: figmaGrey2,
          ),
        ],
      ),
    );
  }
}
