import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsProductBuilderItem extends StatelessWidget {
  const OrderDetailsProductBuilderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 225.w,
              height: 20.h,
              child: Text(
                'Product Name',
                style: TextStyle(
                  color: const Color(0xFF0F1D40),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 15.sp,
                  height: 1.20,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 110.w,
              height: 18.h,
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  'BHD 27.250',
                  style: TextStyle(
                    color: const Color(0xFF0F1D40),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 12.sp,
                    height: 1.18,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        SizedBox(
          width: 225.w,
          height: 26.h,
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              'Storage Type, Unit SizexUnits Per Carton, Italy',
              style: TextStyle(
                color: const Color(0xFF8C93A3),
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                fontSize: 10.sp,
                height: 1.10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
