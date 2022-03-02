import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 107.w,
      height: 110.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: const Color(0xFFFFE3D6),
      ),
    );
  }
}
