import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<BottomNavigationBarItem> get bottomNavBarItem => [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav-item1.svg',
          height: 24.h,
          width: 24.w,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav-item2.svg',
          height: 24.h,
          width: 24.w,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav-item3.svg',
          height: 24.h,
          width: 24.w,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav-item4.svg',
          height: 24.h,
          width: 24.w,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav-item5.svg',
          height: 24.h,
          width: 24.w,
        ),
        label: '',
      ),
    ];
