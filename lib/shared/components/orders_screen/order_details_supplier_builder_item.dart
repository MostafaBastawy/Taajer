import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/shared/components/orders_screen/order_details_product_builder_item.dart';
import 'package:taajer/shared/styles/colors.dart';

class OrderDetailsSupplierBuilderItem extends StatelessWidget {
  const OrderDetailsSupplierBuilderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Supplier #231',
              style: TextStyle(
                color: figmaOurBlack,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: 18.sp,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/images/orders_screen/pending-icon.svg',
              width: 12.w,
              height: 12.h,
            ),
            SizedBox(width: 8.w),
            SizedBox(
              width: 55.w,
              height: 16.h,
              child: Text(
                'Pending',
                style: TextStyle(
                  color: const Color(0xFF525C76),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 10.sp,
                  height: 1.30,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 31.h),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) =>
                OrderDetailsProductBuilderItem(),
            separatorBuilder: (BuildContext context, int index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Container(
                width: 335.w,
                height: 1.h,
                color: const Color(0xFFE2E4E8),
              ),
            ),
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}
