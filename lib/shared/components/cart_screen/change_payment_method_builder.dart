import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/shared/styles/colors.dart';

class ChangePaymentMethodBuilder extends StatelessWidget {
  const ChangePaymentMethodBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: const Color(0xFFE2E4E8), width: 1.0),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/cart_screen/payment-debit-icon.svg',
            width: 19.53.w,
            height: 28.h,
          ),
          SizedBox(width: 23.47.w),
          Text(
            'Benefit',
            style: TextStyle(
              color: figmaShade1,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
          const Spacer(),
          Text(
            'Change',
            style: TextStyle(
              color: figmaPrimaryBlue,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
