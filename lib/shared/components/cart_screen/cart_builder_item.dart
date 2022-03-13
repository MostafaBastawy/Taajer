import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/shared/styles/colors.dart';

class CartBuilderItem extends StatelessWidget {
  const CartBuilderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Supplier #101',
          style: TextStyle(
            color: figmaOurBlack,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 15.sp,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 13.w),
                width: 80.w,
                height: 31.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.r),
                  border:
                      Border.all(color: const Color(0xFFE2E4E8), width: 1.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/cart_screen/truck-icon.svg',
                        height: 20.h, width: 20.w),
                    SizedBox(width: 13.w),
                    Text(
                      'Tomorrow',
                      style: TextStyle(
                        color: const Color(0xFF525C76),
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '28th February 2022',
                      style: TextStyle(
                        color: const Color(0xFF525C76),
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 11.w),
            Container(
              width: 80.w,
              height: 31.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: const Color(0xFFE2E4E8), width: 1.0),
              ),
              child: Center(
                child: Text(
                  'Schedule',
                  style: TextStyle(
                    color: const Color(0xFF525C76),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          width: 343.w,
          padding: EdgeInsetsDirectional.only(
              start: 20.w, end: 13.w, top: 20.h, bottom: 20.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(color: const Color(0xFFE2E4E8), width: 1.0),
          ),
          child: Row(
            children: [
              Image(
                image: const AssetImage('assets/images/product-item.png'),
                width: 58.w,
                height: 58.h,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 25.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pure Cocoa Powder',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 7.h),
                  Text(
                    'Delicio',
                    style: TextStyle(
                      color: const Color(0xFF747C90),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 7.h),
                  SizedBox(
                    width: 235,
                    child: Row(
                      children: [
                        Text(
                          'BHD 0.500',
                          style: TextStyle(
                            color: figmaPrimaryBlue,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 110.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              style: BorderStyle.solid,
                              width: 1.0,
                              color: const Color(0xFFE2E4E8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/browse_screen/minus-icon.svg',
                                height: 16.h,
                                width: 16.w,
                                color: figmaPrimaryBlue,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 21.w),
                                child: Text(
                                  '20',
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: const Color(0xFF494A53),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/images/browse_screen/plus-icon.svg',
                                height: 16.h,
                                width: 16.w,
                                color: figmaPrimaryBlue,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 9.h),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          width: 343.w,
          height: 46.h,
          decoration: BoxDecoration(
            color: const Color(0xFFFFF5CE),
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/warning-icon.svg',
                height: 20.h,
                width: 20.w,
              ),
              SizedBox(width: 12.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Minimum Order Value BHD 20.000',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFFFAD0D),
                      fontStyle: FontStyle.normal,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Add more products or increase quantity.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFFFAD0D),
                      fontStyle: FontStyle.normal,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
