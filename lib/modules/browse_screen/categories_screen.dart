import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/modules/browse_screen/browse_cubit/browse_cubit.dart';
import 'package:taajer/modules/browse_screen/browse_cubit/browse_states.dart';
import 'package:taajer/shared/components/browse_screen/clicked_topbrand_builder_item.dart';
import 'package:taajer/shared/components/browse_screen/row_category_builder_item.dart';
import 'package:taajer/shared/components/tools/product_builder.dart';
import 'package:taajer/shared/styles/colors.dart';

class CategoriesScreen extends StatelessWidget {
  String viewType = 'Grid';
  CategoriesScreen({Key? key}) : super(key: key);

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
          title: const Text('Categories'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 26.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Row(
                  children: [
                    if (index == 0) SizedBox(width: 16.w),
                    RowCategoryBuilderItem(),
                    if (index == 9) SizedBox(width: 16.w),
                  ],
                ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 8.w,
                ),
                itemCount: 10,
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
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
                    onTap: () {},
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
                    onTap: () {},
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
            ),
            SizedBox(height: 20.h),
            if (viewType == 'Grid')
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.w),
                  child: GridView.count(
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
                ),
              ),
            if (viewType == 'List')
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) =>
                        const ClickedTopBrandBuilderItem(),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 17.h),
                    itemCount: 10,
                  ),
                ),
              ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
