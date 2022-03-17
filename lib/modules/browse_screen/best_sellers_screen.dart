import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/modules/browse_screen/browse_cubit/browse_cubit.dart';
import 'package:taajer/modules/browse_screen/browse_cubit/browse_states.dart';
import 'package:taajer/shared/components/browse_screen/clicked_topbrand_builder_item.dart';
import 'package:taajer/shared/components/browse_screen/filter_bottom_sheet.dart';
import 'package:taajer/shared/components/browse_screen/sort_bottom_sheet.dart';
import 'package:taajer/shared/components/tools/product_builder.dart';
import 'package:taajer/shared/styles/colors.dart';

class BestSellersScreen extends StatelessWidget {
  String viewType = 'Grid';
  BestSellersScreen({Key? key}) : super(key: key);

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
          title: const Text('Bestsellers'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sort',
                      style: TextStyle(
                        color: const Color(0xFF494A53),
                        fontStyle: FontStyle.normal,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 9.w),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.white.withOpacity(0.0),
                          context: context,
                          builder: (BuildContext context) =>
                              const SortBottomSheet(),
                        );
                      },
                      child: SvgPicture.asset(
                        'assets/images/browse_screen/sort-icon.svg',
                        width: 24.w,
                        height: 24.h,
                        color: const Color(0xFF3A4662),
                      ),
                    ),
                    SizedBox(width: 9.w),
                    Text(
                      'Filter',
                      style: TextStyle(
                        color: const Color(0xFF494A53),
                        fontStyle: FontStyle.normal,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 9.w),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.white.withOpacity(0.0),
                          context: context,
                          builder: (BuildContext context) =>
                              FilterBottomSheet(),
                        );
                      },
                      child: SvgPicture.asset(
                        'assets/images/browse_screen/filter-icon.svg',
                        width: 24.w,
                        height: 24.h,
                        color: const Color(0xFF3A4662),
                      ),
                    ),
                    SizedBox(width: 9.w),
                    Text(
                      'View',
                      style: TextStyle(
                        color: const Color(0xFF494A53),
                        fontStyle: FontStyle.normal,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 9.w),
                    GestureDetector(
                      onTap: () {
                        viewType = 'Grid';
                        cubit.emit(BrowseStateRefreshState());
                      },
                      child: SvgPicture.asset(
                        'assets/images/browse_screen/grid-view-icon.svg',
                        width: 24.w,
                        height: 24.h,
                        color: viewType == 'Grid'
                            ? figmaPrimaryBlue
                            : const Color(0xFF3A4662),
                      ),
                    ),
                    SizedBox(width: 9.w),
                    GestureDetector(
                      onTap: () {
                        viewType = 'List';
                        cubit.emit(BrowseStateRefreshState());
                      },
                      child: SvgPicture.asset(
                        'assets/images/browse_screen/list-view-icon.svg',
                        width: 24.w,
                        height: 24.h,
                        color: viewType == 'List'
                            ? figmaPrimaryBlue
                            : const Color(0xFF3A4662),
                      ),
                    ),
                    SizedBox(width: 5.w),
                  ],
                ),
                SizedBox(height: 24.h),
                if (viewType == 'Grid')
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 21.0,
                    childAspectRatio: 1 / 1.08,
                    children: List.generate(
                      10,
                      (index) => const ProductBuilder(),
                    ),
                  ),
                if (viewType == 'List')
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) =>
                        const ClickedTopBrandBuilderItem(),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 17.h),
                    itemCount: 10,
                  ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
