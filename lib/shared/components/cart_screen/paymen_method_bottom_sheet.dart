import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/shared/components/cart_screen/payment_method_builder_item.dart';
import 'package:taajer/shared/styles/colors.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.r),
        topRight: Radius.circular(30.r),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 18.w),
        width: 375.w,
        height: 400.h,
        color: Colors.white,
        child: Column(
          children: [
            Text(
              'Choose Payment Method',
              style: TextStyle(
                color: figmaOurBlack,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 47.h),
            PaymentMethodBuilderItem(
              paymentMethodIcon:
                  'assets/images/cart_screen/payment-apple-icon.svg',
              paymentMethodIconWidth: 20.w,
              paymentMethodIconHeight: 12.8.h,
              paymentMethodName: 'Apple Pay',
            ),
            SizedBox(height: 20.h),
            Container(
              width: 343.w,
              height: 1.h,
              color: const Color(0xFFE2E4E8),
            ),
            SizedBox(height: 20.h),
            PaymentMethodBuilderItem(
              paymentMethodIcon:
                  'assets/images/cart_screen/payment-debit-icon.svg',
              paymentMethodIconWidth: 13.95.w,
              paymentMethodIconHeight: 20.h,
              paymentMethodName: 'Benefit',
            ),
            SizedBox(height: 20.h),
            Container(
              width: 343.w,
              height: 1.h,
              color: const Color(0xFFE2E4E8),
            ),
            SizedBox(height: 20.h),
            PaymentMethodBuilderItem(
              paymentMethodIcon:
                  'assets/images/cart_screen/payment-credit-icon.svg',
              paymentMethodIconWidth: 20.w,
              paymentMethodIconHeight: 20.h,
              paymentMethodName: 'Debit & Credit Card',
            ),
            SizedBox(height: 20.h),
            Container(
              width: 343.w,
              height: 1.h,
              color: const Color(0xFFE2E4E8),
            ),
            SizedBox(height: 20.h),
            PaymentMethodBuilderItem(
              paymentMethodIcon:
                  'assets/images/cart_screen/payment-wallet-icon.svg',
              paymentMethodIconWidth: 20.w,
              paymentMethodIconHeight: 20.h,
              paymentMethodName: 'Wallet',
            ),
          ],
        ),
      ),
    );
  }
}
