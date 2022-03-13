import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpecificationBuilderItem extends StatelessWidget {
  String? specificationItemIcon;
  String? specificationItemName;
  String? specificationItemValue;
  SpecificationBuilderItem({
    Key? key,
    required this.specificationItemIcon,
    required this.specificationItemName,
    required this.specificationItemValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      width: 342.w,
      height: 39.h,
      color: Colors.white,
      child: Row(
        children: [
          SvgPicture.asset(
            specificationItemIcon!,
            width: 18.w,
            height: 18.h,
          ),
          SizedBox(width: 12.w),
          Text(
            specificationItemName!,
            style: TextStyle(
              fontStyle: FontStyle.normal,
              color: const Color(0xFF525C76),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              height: 1.6,
            ),
          ),
          const Spacer(),
          Text(
            specificationItemValue!,
            style: TextStyle(
              fontStyle: FontStyle.normal,
              color: const Color(0xFFB2B7C2),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
