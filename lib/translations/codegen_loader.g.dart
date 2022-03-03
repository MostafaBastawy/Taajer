// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "languageCountryScreenChooseYourLanguage": "Choose Your Language",
  "languageCountryScreenEnglish": "English",
  "languageCountryScreenArabic": "اللغة العربية",
  "languageCountryScreenChooseYourCountry": "Choose Your Country",
  "languageCountryScreenBahrain": "Bahrain",
  "languageCountryScreenSaudiArabia": "Saudi Arabia",
  "languageCountryScreenUnitedArabEmirates": "United Arab Emirates"
};
static const Map<String,dynamic> ar = {
  "languageCountryScreenChooseYourLanguage": "إختر اللغة",
  "languageCountryScreenEnglish": "English",
  "languageCountryScreenArabic": "اللغة العربية",
  "languageCountryScreenChooseYourCountry": "إختر الدولة",
  "languageCountryScreenBahrain": "البحرين",
  "languageCountryScreenSaudiArabia": "السعودية",
  "languageCountryScreenUnitedArabEmirates": "الإمارات"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}
