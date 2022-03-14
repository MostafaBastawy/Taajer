import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/shared/styles/colors.dart';

class PaymentMethodBuilderItem extends StatelessWidget {
  String? paymentMethodIcon;
  String? paymentMethodName;
  double? paymentMethodIconWidth;
  double? paymentMethodIconHeight;

  PaymentMethodBuilderItem({
    Key? key,
    required this.paymentMethodIcon,
    required this.paymentMethodName,
    required this.paymentMethodIconWidth,
    required this.paymentMethodIconHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          paymentMethodIcon!,
          width: paymentMethodIconWidth,
          height: paymentMethodIconHeight,
        ),
        SizedBox(width: 9.w),
        Text(
          paymentMethodName!,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: figmaOurBlack,
            fontStyle: FontStyle.normal,
          ),
        ),
        const Spacer(),
        SvgPicture.asset(
          'assets/images/check-circle.svg',
          width: 30.w,
          height: 30.h,
          color: const Color(0xFFDEE6EE),
        ),
        SizedBox(width: 20.w),
      ],
    );
  }
}
