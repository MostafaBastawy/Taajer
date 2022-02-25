import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: EasyLocalization.of(context)!.locale == const Locale('en')
          ? 'Gotham'
          : 'Cairo',
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
    );
ThemeData darkTheme = ThemeData();
