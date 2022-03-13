import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/modules/cart_screen/cart_cubit/cart_cubit.dart';
import 'package:taajer/modules/cart_screen/cart_cubit/cart_states.dart';
import 'package:taajer/modules/cart_screen/checkout_screen.dart';
import 'package:taajer/shared/components/cart_screen/cart_builder_item.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/styles/colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartCubit cubit = CartCubit.get(context);
    return BlocBuilder<CartCubit, CartStates>(
      builder: (BuildContext context, state) => Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) =>
                      const CartBuilderItem(),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 37.h),
                  itemCount: 3,
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                'Save On Your Order',
                style: TextStyle(
                  color: figmaOurBlack,
                  fontStyle: FontStyle.normal,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 23.5.h),
              Container(
                padding: EdgeInsetsDirectional.only(start: 12.w, end: 17.w),
                width: 340.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(
                    color: const Color(0xFFE2E4E8),
                    width: 1.0,
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/cart_screen/cupon-icon.svg',
                      width: 28.w,
                      height: 28.h,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Coupon Code',
                      style: TextStyle(
                        color: const Color(0xFFB2B7C2),
                        fontStyle: FontStyle.normal,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Submit',
                      style: TextStyle(
                        color: figmaPrimaryBlue,
                        fontStyle: FontStyle.normal,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                'Order Summary',
                style: TextStyle(
                  color: figmaOurBlack,
                  fontStyle: FontStyle.normal,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 17.35.h),
              Row(
                children: [
                  Text(
                    'Items',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'BHD 22.000',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.47.h),
              Row(
                children: [
                  Text(
                    'VAT (10%)',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'BHD 2.200',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.47.h),
              Row(
                children: [
                  Text(
                    'Delivery',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'BHD 3.000',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.47.h),
              Row(
                children: [
                  Text(
                    'Discount',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '- BHD 5.000',
                    style: TextStyle(
                      color: const Color(0xFF028177),
                      fontStyle: FontStyle.normal,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13.88.h),
              Row(
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontStyle: FontStyle.normal,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'BHD 22.200',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontStyle: FontStyle.normal,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 23.59.h),
              Row(
                children: [
                  Expanded(
                    child: DefaultButton(
                      height: 48.h,
                      width: 162.w,
                      label: 'Add Items',
                      onPressed: () {},
                      labelColor: figmaPrimaryBlue,
                      labelWeight: FontWeight.w700,
                      backGroundColor: Colors.white,
                      labelFontSize: 18.sp,
                      labelFontHeight: 1.25,
                    ),
                  ),
                  SizedBox(width: 19.w),
                  Expanded(
                    child: DefaultButton(
                      height: 48.h,
                      width: 162.w,
                      label: 'Checkout',
                      onPressed: () {
                        navigateTo(widget: CheckoutScreen(), context: context);
                      },
                      labelColor: Colors.white,
                      labelWeight: FontWeight.w700,
                      backGroundColor: figmaPrimaryBlue,
                      labelFontSize: 18.sp,
                      labelFontHeight: 1.25,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 34.h),
            ],
          ),
        ),
      ),
    );
  }
}
