import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/app_cubit/app_cubit.dart';

List<BottomNavigationBarItem> bottomNavBarItem(BuildContext context) => [
      BottomNavigationBarItem(
        icon: AppCubit.get(context).currentIndex == 0
            ? SvgPicture.asset(
                'assets/images/bottom_nav_bar/selected-nav-item1.svg',
                height: 24.h,
                width: 24.w,
              )
            : SvgPicture.asset(
                'assets/images/bottom_nav_bar/nav-item1.svg',
                height: 24.h,
                width: 24.w,
              ),
        label: 'Browse',
      ),
      BottomNavigationBarItem(
        icon: AppCubit.get(context).currentIndex == 1
            ? SvgPicture.asset(
                'assets/images/bottom_nav_bar/selected-nav-item2.svg',
                height: 24.h,
                width: 24.w,
              )
            : SvgPicture.asset(
                'assets/images/bottom_nav_bar/nav-item2.svg',
                height: 24.h,
                width: 24.w,
              ),
        label: 'Wishlist',
      ),
      BottomNavigationBarItem(
        icon: AppCubit.get(context).currentIndex == 2
            ? SvgPicture.asset(
                'assets/images/bottom_nav_bar/selected-nav-item3.svg',
                height: 24.h,
                width: 24.w,
              )
            : SvgPicture.asset(
                'assets/images/bottom_nav_bar/nav-item3.svg',
                height: 24.h,
                width: 24.w,
              ),
        label: 'Orders',
      ),
      BottomNavigationBarItem(
        icon: AppCubit.get(context).currentIndex == 3
            ? SvgPicture.asset(
                'assets/images/bottom_nav_bar/selected-nav-item4.svg',
                height: 24.h,
                width: 24.w,
              )
            : SvgPicture.asset(
                'assets/images/bottom_nav_bar/nav-item4.svg',
                height: 24.h,
                width: 24.w,
              ),
        label: 'Cart',
      ),
      BottomNavigationBarItem(
        icon: AppCubit.get(context).currentIndex == 4
            ? SvgPicture.asset(
                'assets/images/bottom_nav_bar/selected-nav-item5.svg',
                height: 24.h,
                width: 24.w,
              )
            : SvgPicture.asset(
                'assets/images/bottom_nav_bar/nav-item5.svg',
                height: 24.h,
                width: 24.w,
              ),
        label: 'Profile',
      ),
    ];
