import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/shared/styles/colors.dart';

class SortBuilderItem extends StatelessWidget {
  String? sortName;
  SortBuilderItem({
    Key? key,
    required this.sortName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Price (lowest first)',
          style: TextStyle(
            color: figmaOurBlack,
            fontStyle: FontStyle.normal,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        SvgPicture.asset(
          'assets/images/check-circle.svg',
          width: 24.w,
          height: 24.h,
          color: const Color(0xFFE2E4E8),
        ),
      ],
    );
  }
}
