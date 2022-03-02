import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/shared/styles/colors.dart';

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 186.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(width: 1.0, color: figmaGrey1),
      ),
      child: Column(
        children: [],
      ),
    );
  }
}
