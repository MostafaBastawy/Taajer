import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:taajer/modules/browse_screen/browse_cubit/browse_cubit.dart';
import 'package:taajer/modules/browse_screen/browse_cubit/browse_states.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/styles/colors.dart';

class FilterBottomSheet extends StatelessWidget {
  double sliderValue = 10000;
  List<String> string = [
    'All',
    'Food and Beverage',
    'Beverages',
    'Baking Ingredients',
  ];

  FilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BrowseCubit cubit = BrowseCubit.get(context);
    return BlocBuilder<BrowseCubit, BrowseStates>(
      builder: (BuildContext context, state) => ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        child: Container(
          height: 700.h,
          padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 16.w),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        'assets/images/browse_screen/close-icon.svg',
                        width: 24.w,
                        height: 24.h,
                        color: const Color(0xFF525C76),
                      ),
                    ),
                    Text(
                      'Filter',
                      style: TextStyle(
                        color: figmaOurBlack,
                        fontStyle: FontStyle.normal,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Clear All',
                        style: TextStyle(
                          color: figmaPrimaryBlue,
                          fontStyle: FontStyle.normal,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 26.h),
                Text(
                  'Price Range',
                  style: TextStyle(
                    color: figmaOurBlack,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 68.h),
                SfSliderTheme(
                  data: SfSliderThemeData(
                    tooltipBackgroundColor: figmaPrimaryBlue,
                    tooltipTextStyle: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: 10.sp,
                    ),
                    thumbRadius: 12.5.r,
                    thumbColor: figmaPrimaryBlue,
                    thumbStrokeColor: Colors.red,
                    activeTrackHeight: 4.h,
                    activeTrackColor: figmaPrimaryBlue,
                    inactiveTrackHeight: 2.h,
                    inactiveTrackColor: const Color(0xFFCACDD5),
                    trackCornerRadius: 3.r,
                    overlayRadius: 0,
                  ),
                  child: SfSlider(
                    min: 10000,
                    max: 100000,
                    value: sliderValue,
                    enableTooltip: true,
                    activeColor: figmaPrimaryBlue,
                    inactiveColor: const Color(0xFFCACDD5),
                    //tooltipShape: const SfPaddleTooltipShape(),
                    shouldAlwaysShowTooltip: true,
                    onChanged: (value) {
                      print(value);
                      if (value == 10000) {
                        sliderValue = 10000;
                      } else if (value > 10000 && value <= 20000) {
                        sliderValue = 20000;
                      } else if (value > 20000 && value <= 30000) {
                        sliderValue = 30000;
                      } else if (value > 30000 && value <= 40000) {
                        sliderValue = 40000;
                      } else if (value > 40000 && value <= 50000) {
                        sliderValue = 50000;
                      } else if (value > 50000 && value <= 60000) {
                        sliderValue = 60000;
                      } else if (value > 60000 && value <= 70000) {
                        sliderValue = 70000;
                      } else if (value > 70000 && value <= 80000) {
                        sliderValue = 80000;
                      } else if (value > 80000 && value <= 90000) {
                        sliderValue = 90000;
                      } else if (value > 90000) {
                        sliderValue = 100000;
                      }
                      cubit.emit(BrowseStateRefreshState());
                    },
                  ),
                ),
                SizedBox(height: 18.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    children: [
                      Text(
                        'BHD 10.000',
                        style: TextStyle(
                          color: figmaOurBlack,
                          fontWeight: FontWeight.w700,
                          fontSize: 10.sp,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'BHD 100.000+',
                        style: TextStyle(
                          color: figmaOurBlack,
                          fontWeight: FontWeight.w700,
                          fontSize: 10.sp,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 26.h),
                Text(
                  'Categories',
                  style: TextStyle(
                    color: figmaOurBlack,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    string.length,
                    (index) => Wrap(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          height: 26.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: const Color(0xFF8C93A3)),
                          ),
                          child: Text(
                            string[index],
                            style: TextStyle(
                              color: const Color(0xFF8C93A3),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.6,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        if (index == string.length - 1)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Show More',
                              style: TextStyle(
                                color: figmaPrimaryBlue,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.1,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 34.h),
                Text(
                  'Made In',
                  style: TextStyle(
                    color: figmaOurBlack,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    string.length,
                    (index) => Wrap(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          height: 26.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: const Color(0xFF8C93A3)),
                          ),
                          child: Text(
                            string[index],
                            style: TextStyle(
                              color: const Color(0xFF8C93A3),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.6,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        if (index == string.length - 1)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Show More',
                              style: TextStyle(
                                color: figmaPrimaryBlue,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.1,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 34.h),
                Text(
                  'Package Type',
                  style: TextStyle(
                    color: figmaOurBlack,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    string.length,
                    (index) => Wrap(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          height: 26.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: const Color(0xFF8C93A3)),
                          ),
                          child: Text(
                            string[index],
                            style: TextStyle(
                              color: const Color(0xFF8C93A3),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.6,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        if (index == string.length - 1)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Show More',
                              style: TextStyle(
                                color: figmaPrimaryBlue,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.1,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 34.h),
                Text(
                  'Flavor',
                  style: TextStyle(
                    color: figmaOurBlack,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    string.length,
                    (index) => Wrap(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          height: 26.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: const Color(0xFF8C93A3)),
                          ),
                          child: Text(
                            string[index],
                            style: TextStyle(
                              color: const Color(0xFF8C93A3),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.6,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        if (index == string.length - 1)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Show More',
                              style: TextStyle(
                                color: figmaPrimaryBlue,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.1,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 34.h),
                Text(
                  'Type',
                  style: TextStyle(
                    color: figmaOurBlack,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    string.length,
                    (index) => Wrap(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          height: 26.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: const Color(0xFF8C93A3)),
                          ),
                          child: Text(
                            string[index],
                            style: TextStyle(
                              color: const Color(0xFF8C93A3),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.6,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        if (index == string.length - 1)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Show More',
                              style: TextStyle(
                                color: figmaPrimaryBlue,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.1,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 34.h),
                Text(
                  'Specifications',
                  style: TextStyle(
                    color: figmaOurBlack,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    string.length,
                    (index) => Wrap(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          height: 26.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: const Color(0xFF8C93A3)),
                          ),
                          child: Text(
                            string[index],
                            style: TextStyle(
                              color: const Color(0xFF8C93A3),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.6,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        if (index == string.length - 1)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Show More',
                              style: TextStyle(
                                color: figmaPrimaryBlue,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.1,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 34.h),
                Text(
                  'Storage Type',
                  style: TextStyle(
                    color: figmaOurBlack,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    string.length,
                    (index) => Wrap(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          height: 26.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: const Color(0xFF8C93A3)),
                          ),
                          child: Text(
                            string[index],
                            style: TextStyle(
                              color: const Color(0xFF8C93A3),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.6,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        if (index == string.length - 1)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Show More',
                              style: TextStyle(
                                color: figmaPrimaryBlue,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.1,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 34.h),
                Text(
                  'Package Size',
                  style: TextStyle(
                    color: figmaOurBlack,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    string.length,
                    (index) => Wrap(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          height: 26.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: const Color(0xFF8C93A3)),
                          ),
                          child: Text(
                            string[index],
                            style: TextStyle(
                              color: const Color(0xFF8C93A3),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.6,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        if (index == string.length - 1)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Show More',
                              style: TextStyle(
                                color: figmaPrimaryBlue,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.1,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 34.h),
                Text(
                  'Beef Cut',
                  style: TextStyle(
                    color: figmaOurBlack,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    string.length,
                    (index) => Wrap(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          height: 26.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: const Color(0xFF8C93A3)),
                          ),
                          child: Text(
                            string[index],
                            style: TextStyle(
                              color: const Color(0xFF8C93A3),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.6,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        if (index == string.length - 1)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Show More',
                              style: TextStyle(
                                color: figmaPrimaryBlue,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.1,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 34.h),
                Text(
                  'Total Carton Size',
                  style: TextStyle(
                    color: figmaOurBlack,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    string.length,
                    (index) => Wrap(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          height: 26.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: const Color(0xFF8C93A3)),
                          ),
                          child: Text(
                            string[index],
                            style: TextStyle(
                              color: const Color(0xFF8C93A3),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.6,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        if (index == string.length - 1)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Show More',
                              style: TextStyle(
                                color: figmaPrimaryBlue,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.1,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 34.h),
                Text(
                  'Features',
                  style: TextStyle(
                    color: figmaOurBlack,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    string.length,
                    (index) => Wrap(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          height: 26.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: const Color(0xFF8C93A3)),
                          ),
                          child: Text(
                            string[index],
                            style: TextStyle(
                              color: const Color(0xFF8C93A3),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.6,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        if (index == string.length - 1)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Show More',
                              style: TextStyle(
                                color: figmaPrimaryBlue,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.1,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 34.h),
                Text(
                  'Portion Weight',
                  style: TextStyle(
                    color: figmaOurBlack,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    string.length,
                    (index) => Wrap(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          height: 26.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: const Color(0xFF8C93A3)),
                          ),
                          child: Text(
                            string[index],
                            style: TextStyle(
                              color: const Color(0xFF8C93A3),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.6,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        if (index == string.length - 1)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Show More',
                              style: TextStyle(
                                color: figmaPrimaryBlue,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.1,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 91.h),
                DefaultButton(
                  height: 48.h,
                  width: 343.w,
                  label: 'Apply',
                  onPressed: () {},
                  labelColor: Colors.white,
                  labelWeight: FontWeight.w700,
                  backGroundColor: figmaPrimaryBlue,
                  labelFontHeight: 1.25,
                  labelFontSize: 18.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
