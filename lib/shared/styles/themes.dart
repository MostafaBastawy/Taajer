import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/shared/styles/colors.dart';

ThemeData lightTheme(BuildContext context) => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: EasyLocalization.of(context)!.locale == const Locale('en')
          ? 'Gotham'
          : 'Cairo',
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: primaryBlack,
        ),
        titleTextStyle: TextStyle(
          color: primaryBlack,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.165,
        ),
      ),
    );
ThemeData darkTheme = ThemeData();
