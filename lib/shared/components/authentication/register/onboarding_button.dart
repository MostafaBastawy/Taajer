import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingButton extends StatelessWidget {
  double? height;
  double? width;
  String? label;
  Function? onPressed;
  Color? backGroundColor;
  Color? labelColor;
  FontWeight? labelWeight;
  OnBoardingButton({
    Key? key,
    required this.height,
    required this.width,
    required this.label,
    required this.onPressed,
    this.backGroundColor,
    required this.labelColor,
    required this.labelWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(
          color: const Color(0xAF0761FD),
          width: 1.0,
        ),
      ),
      child: TextButton(
        onPressed: () {
          onPressed!();
        },
        child: Text(
          label.toString(),
          style: TextStyle(
            fontWeight: labelWeight,
            fontSize: 15.sp,
            color: labelColor,
          ),
        ),
      ),
    );
  }
}
