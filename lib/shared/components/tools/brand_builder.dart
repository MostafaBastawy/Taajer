import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/shared/styles/colors.dart';

class BrandBuilder extends StatelessWidget {
  const BrandBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 107.w,
      height: 107.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(width: 1.0, color: figmaGrey1),
      ),
      child: Center(
        child: Image(
          image: AssetImage('assets/images/brand-item.png'),
          height: 44.w,
          width: 66.w,
        ),
      ),
    );
  }
}
