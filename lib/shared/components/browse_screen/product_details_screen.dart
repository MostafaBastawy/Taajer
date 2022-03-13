import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/modules/browse_screen/browse_cubit/browse_cubit.dart';
import 'package:taajer/modules/browse_screen/browse_cubit/browse_states.dart';
import 'package:taajer/shared/components/browse_screen/product_details_carousel_slider/product_details_carouse_slider_builder.dart';
import 'package:taajer/shared/components/browse_screen/specification_builder_item.dart';
import 'package:taajer/shared/styles/colors.dart';

class ProductDetailsScreen extends StatelessWidget {
  bool description = true;
  bool specifications = false;
  ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BrowseCubit cubit = BrowseCubit.get(context);

    return BlocBuilder<BrowseCubit, BrowseStates>(
      builder: (BuildContext context, state) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              'assets/images/arrow-left-icon.svg',
              height: 32.h,
              width: 32.w,
            ),
          ),
          actions: [
            SvgPicture.asset(
              'assets/images/bottom_nav_bar/nav-item2.svg',
              height: 28.h,
              width: 28.w,
              color: const Color(0xFF3A4662),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset(
              'assets/images/bottom_nav_bar/nav-item4.svg',
              height: 28.h,
              width: 28.w,
              color: const Color(0xFF3A4662),
            ),
            SizedBox(width: 16.w),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ProductDetailsCarouselSliderBuilder(),
                      SizedBox(height: 26.h),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pepsi Cola',
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  color: const Color(0xFF8C93A3),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                'Pepsi – 300ml',
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  color: figmaPrimaryBlue,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            width: 53.w,
                            height: 28.h,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF5CE),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/browse_screen/ticket-icon.svg',
                                  width: 20.w,
                                  height: 20.h,
                                ),
                                SizedBox(width: 6.25.w),
                                Text(
                                  '10',
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: figmaOurBlack,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 13.h),
                      Container(
                        padding: const EdgeInsets.all(4),
                        width: 342.w,
                        height: 43.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE2E4E8),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  description = true;
                                  specifications = false;
                                  cubit.emit(BrowseStateRefreshState());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: description
                                        ? Colors.white
                                        : const Color(0xFFE2E4E8),
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Description',
                                      style: TextStyle(
                                        color: const Color(0xFF525C76),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  description = false;
                                  specifications = true;
                                  cubit.emit(BrowseStateRefreshState());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: specifications
                                        ? Colors.white
                                        : const Color(0xFFE2E4E8),
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Specifications',
                                      style: TextStyle(
                                        color: const Color(0xFF525C76),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      if (description)
                        SizedBox(
                          width: 309.w,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan... Sed dignissim, metus nec fringilla accumsan',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: const Color(0xFF8C93A3),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.6,
                            ),
                          ),
                        ),
                      if (specifications)
                        Column(
                          children: [
                            SpecificationBuilderItem(
                              specificationItemIcon:
                                  'assets/images/browse_screen/unit-size-icon.svg',
                              specificationItemName: 'Unit Size',
                              specificationItemValue: '300ml',
                            ),
                            Container(
                              height: 1,
                              width: 342,
                              color: const Color(0xFFEEEFF2),
                            ),
                            SizedBox(height: 20.h),
                            SpecificationBuilderItem(
                              specificationItemIcon:
                                  'assets/images/browse_screen/shelf-life-icon.svg',
                              specificationItemName: 'Shelf Life',
                              specificationItemValue: '365 Days',
                            ),
                            Container(
                              height: 1,
                              width: 342,
                              color: const Color(0xFFEEEFF2),
                            ),
                            SizedBox(height: 20.h),
                            SpecificationBuilderItem(
                              specificationItemIcon:
                                  'assets/images/browse_screen/unit-size-icon.svg',
                              specificationItemName: 'Units Per Carton',
                              specificationItemValue: '24',
                            ),
                            Container(
                              height: 1,
                              width: 342,
                              color: const Color(0xFFEEEFF2),
                            ),
                            SizedBox(height: 20.h),
                            SpecificationBuilderItem(
                              specificationItemIcon:
                                  'assets/images/browse_screen/storage-icon.svg',
                              specificationItemName: 'Storage Type',
                              specificationItemValue: 'Chilled',
                            ),
                            Container(
                              height: 1,
                              width: 342,
                              color: const Color(0xFFEEEFF2),
                            ),
                            SizedBox(height: 20.h),
                            SpecificationBuilderItem(
                              specificationItemIcon:
                                  'assets/images/browse_screen/country-icon.svg',
                              specificationItemName: 'Country of Origin',
                              specificationItemValue: 'U.S.A',
                            ),
                            Container(
                              height: 1,
                              width: 342,
                              color: const Color(0xFFEEEFF2),
                            ),
                            SizedBox(height: 80.h),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 121.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xFFE2E4E8),
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/browse_screen/minus-icon.svg',
                          height: 20.h,
                          width: 20.w,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: figmaOurBlack,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/images/browse_screen/plus-icon.svg',
                          height: 20.h,
                          width: 20.w,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    width: 198.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: figmaPrimaryBlue,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'BHD 11.310',
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          'assets/images/bottom_nav_bar/nav-item4.svg',
                          height: 20.h,
                          width: 20.w,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.h),
            ],
          ),
        ),
      ),
    );
  }
}
