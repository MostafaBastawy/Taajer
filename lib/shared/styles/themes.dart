import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          color: figmaOurBlack,
        ),
        titleTextStyle: TextStyle(
          color: figmaOurBlack,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.165,
          fontStyle: FontStyle.normal,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.red,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0.0,
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedItemColor: Color(0xFFB2B7C2),
        selectedItemColor: figmaPrimaryBlue,
        type: BottomNavigationBarType.fixed,
      ),
    );
ThemeData darkTheme = ThemeData();
