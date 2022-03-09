import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/app_cubit/app_cubit.dart';
import 'package:taajer/shared/styles/colors.dart';

List<BottomNavigationBarItem> bottomNavBarItem(BuildContext context) => [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav-item1.svg',
          height: 24.h,
          width: 24.w,
          color: AppCubit.get(context).currentIndex == 0
              ? figmaPrimaryBlue
              : const Color(0xFFB2B7C2),
        ),
        label: 'Browse',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav-item2.svg',
          height: 24.h,
          width: 24.w,
          color: AppCubit.get(context).currentIndex == 1
              ? figmaPrimaryBlue
              : const Color(0xFFB2B7C2),
        ),
        label: 'Wishlist',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav-item3.svg',
          height: 24.h,
          width: 24.w,
          color: AppCubit.get(context).currentIndex == 2
              ? figmaPrimaryBlue
              : const Color(0xFFB2B7C2),
        ),
        label: 'Orders',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav-item4.svg',
          height: 24.h,
          width: 24.w,
          color: AppCubit.get(context).currentIndex == 3
              ? figmaPrimaryBlue
              : const Color(0xFFB2B7C2),
        ),
        label: 'Cart',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav-item5.svg',
          height: 24.h,
          width: 24.w,
          color: AppCubit.get(context).currentIndex == 4
              ? figmaPrimaryBlue
              : const Color(0xFFB2B7C2),
        ),
        label: 'Profile',
      ),
    ];
