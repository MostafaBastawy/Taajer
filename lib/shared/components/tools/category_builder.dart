import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/shared/styles/colors.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Meat',
            style: TextStyle(
              fontSize: 13.sp,
              fontStyle: FontStyle.normal,
              letterSpacing: -0.165,
              color: figmaOurBlack,
              fontWeight: FontWeight.w400,
            ),
          ),
          Image(
            image: const AssetImage('assets/images/category-item.png'),
            height: 74.w,
            width: 94.w,
          ),
        ],
      ),
    );
  }
}
