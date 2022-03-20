import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/shared/styles/colors.dart';

class BrandBuilder extends StatelessWidget {
  const BrandBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 107.w,
          height: 107.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(width: 1.0, color: figmaGrey1),
          ),
          child: Center(
            child: Image(
              image: const AssetImage('assets/images/brand-item.png'),
              height: 44.w,
              width: 66.w,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: 100.w,
          height: 11.h,
          child: Center(
            child: Text(
              'JBCOCOA',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: figmaShade1,
                fontSize: 11.sp,
                height: 1.11,
                letterSpacing: -0.165,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        )
      ],
    );
  }
}
