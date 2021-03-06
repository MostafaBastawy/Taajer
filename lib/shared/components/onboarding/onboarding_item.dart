import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/models/onboarding_model.dart';
import 'package:taajer/shared/styles/colors.dart';

class OnBoardingItemBuilder extends StatelessWidget {
  OnBoardingModel? onBoardingModel;

  OnBoardingItemBuilder({
    Key? key,
    required this.onBoardingModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SvgPicture.asset(
            onBoardingModel!.onBoardingImage!,
            height: 300.h,
            width: 300.w,
          ),
        ),
        SizedBox(height: 37.h),
        Text(
          onBoardingModel!.onBoardingBoldText!,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 35.sp,
            color: figmaOurBlack,
            letterSpacing: -0.165,
            height: 1.11,
            fontStyle: FontStyle.normal,
          ),
        ),
        SizedBox(height: 22.h),
        Text(
          onBoardingModel!.onBoardingText!,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15.sp,
            color: figmaShade2,
            letterSpacing: -0.165,
            height: 1.20,
            fontStyle: FontStyle.normal,
          ),
        ),
      ],
    );
  }
}
