import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/shared/components/browse_screen/carousel_slider/carousel_slider_builder.dart';
import 'package:taajer/shared/components/browse_screen/complete_registration_bottom_sheet.dart';
import 'package:taajer/shared/components/browse_screen/product_details_screen.dart';
import 'package:taajer/shared/components/tools/brand_builder.dart';
import 'package:taajer/shared/components/tools/category_builder.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/components/tools/product_builder.dart';
import 'package:taajer/shared/styles/colors.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 4.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              width: 343.w,
              height: 48.h,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: const Color(0xFFE2E4E8),
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Row(
                children: [
                  Text(
                    'What are you looking for?',
                    style: TextStyle(
                      color: const Color(0xFFB2B7C2),
                      fontStyle: FontStyle.normal,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    'assets/images/search-icon.svg',
                    height: 15.h,
                    width: 15.w,
                    color: figmaOurBlack,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              width: 343.w,
              height: 46.h,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF5CE),
                border: Border.all(
                  width: 1.0,
                  color: const Color(0xFFFFAD0D),
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 4),
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    blurRadius: 5,
                    spreadRadius: -1,
                  ),
                ],
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/warning-icon.svg',
                    height: 17.h,
                    width: 17.w,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    'Complete Registration',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFFFAD0D),
                      fontStyle: FontStyle.normal,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            const CarouselSliderBuilder(),
            SizedBox(height: 21.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    'Top Categories',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      fontStyle: FontStyle.normal,
                      letterSpacing: -0.165,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    'assets/images/arrow-right-icon.svg',
                    width: 24.w,
                    height: 24.h,
                    color: figmaPrimaryBlue,
                  ),
                ],
              ),
            ),
            SizedBox(height: 17.h),
            SizedBox(
              height: 110.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Row(
                  children: [
                    if (index == 0) SizedBox(width: 16.w),
                    CategoryBuilder(),
                    if (index == 9) SizedBox(width: 16.w),
                  ],
                ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 10.w,
                ),
                itemCount: 10,
              ),
            ),
            SizedBox(height: 29.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    'Best Selling Product',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      fontStyle: FontStyle.normal,
                      letterSpacing: -0.165,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    'assets/images/arrow-right-icon.svg',
                    width: 24.w,
                    height: 24.h,
                    color: figmaPrimaryBlue,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            SizedBox(
              height: 188.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Row(
                  children: [
                    if (index == 0) SizedBox(width: 16.w),
                    GestureDetector(
                      onTap: () {
                        navigateTo(
                          widget: ProductDetailsScreen(),
                          context: context,
                        );
                      },
                      child: const ProductBuilder(),
                    ),
                    if (index == 9) SizedBox(width: 16.w),
                  ],
                ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 10.w,
                ),
                itemCount: 10,
              ),
            ),
            SizedBox(height: 23.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    'Feature Product',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      fontStyle: FontStyle.normal,
                      letterSpacing: -0.165,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    'assets/images/arrow-right-icon.svg',
                    width: 24.w,
                    height: 24.h,
                    color: figmaPrimaryBlue,
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            SizedBox(
              height: 188.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Row(
                  children: [
                    if (index == 0) SizedBox(width: 16.w),
                    GestureDetector(
                      onTap: () {
                        showBottomSheet(
                          backgroundColor: Colors.white.withOpacity(0.0),
                          context: context,
                          builder: (BuildContext context) =>
                              const CompleteRegistrationBottomSheet(),
                        );
                      },
                      child: const ProductBuilder(),
                    ),
                    if (index == 9) SizedBox(width: 16.w),
                  ],
                ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 10.w,
                ),
                itemCount: 10,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    'Top Brands',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      fontStyle: FontStyle.normal,
                      letterSpacing: -0.165,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    'assets/images/arrow-right-icon.svg',
                    width: 24.w,
                    height: 24.h,
                    color: figmaPrimaryBlue,
                  ),
                ],
              ),
            ),
            SizedBox(height: 14.h),
            SizedBox(
              height: 107.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Row(
                  children: [
                    if (index == 0) SizedBox(width: 16.w),
                    const BrandBuilder(),
                    if (index == 9) SizedBox(width: 16.w),
                  ],
                ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 10.w,
                ),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
