import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/shared/components/browse_screen/sort_builder_item.dart';
import 'package:taajer/shared/styles/colors.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.r),
        topRight: Radius.circular(30.r),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 16.w),
        width: 375.w,
        height: 280.h,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sort By',
              style: TextStyle(
                color: figmaOurBlack,
                fontStyle: FontStyle.normal,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 25.h),
            SortBuilderItem(
              sortName: 'Price (lowest first)',
            ),
            SizedBox(height: 21.h),
            SortBuilderItem(
              sortName: 'Price (highest first)',
            ),
            SizedBox(height: 21.h),
            SortBuilderItem(
              sortName: 'Relevance',
            ),
          ],
        ),
      ),
    );
  }
}
