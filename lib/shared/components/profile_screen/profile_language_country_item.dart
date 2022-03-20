import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/shared/styles/colors.dart';

class ProfileLanguageCountryItemBuilder extends StatelessWidget {
  String? image;
  String? text;
  String? fontFamily;
  double? fontHeight = 1.6;
  Color borderColor = figmaGrey1;

  ProfileLanguageCountryItemBuilder({
    Key? key,
    required this.image,
    required this.text,
    required this.borderColor,
    this.fontHeight,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344.w,
      height: 46.h,
      padding: const EdgeInsets.all(10),
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
              fontWeight: FontWeight.w600,
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
            color: borderColor,
          ),
        ],
      ),
    );
  }
}
