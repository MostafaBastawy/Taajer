import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/modules/onboarding/onboarding.dart';
import 'package:taajer/shared/components/authentication/register/language_country_item.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/components/tools/shared_preference/keys.dart';
import 'package:taajer/shared/components/tools/shared_preference/shared_preference.dart';
import 'package:taajer/shared/styles/colors.dart';
import 'package:taajer/translations/locale_keys.g.dart';

class LanguageCountryScreen extends StatelessWidget {
  String? language;
  String? country;
  LanguageCountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationCubit cubit = AuthenticationCubit.get(context);
    language = LocaleKeys.languageCountryScreenEnglish.tr();
    country = LocaleKeys.languageCountryScreenBahrain.tr();
    return BlocBuilder<AuthenticationCubit, AuthenticationStates>(
      builder: (BuildContext context, state) => Scaffold(
        appBar: null,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 79.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.languageCountryScreenChooseYourLanguage.tr(),
                style: TextStyle(
                  color: figmaOurBlack,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.165,
                ),
              ),
              SizedBox(height: 22.h),
              GestureDetector(
                onTap: () {
                  language = LocaleKeys.languageCountryScreenEnglish.tr();
                  EasyLocalization.of(context)!.setLocale(const Locale('en'));
                  cubit.emit(AuthenticationStatesRefreshState());
                },
                child: LanguageCountryItemBuilder(
                  image: 'assets/images/us-english.png',
                  text: LocaleKeys.languageCountryScreenEnglish.tr(),
                  borderColor:
                      language == LocaleKeys.languageCountryScreenEnglish.tr()
                          ? figmaPrimaryBlue
                          : figmaGrey1,
                ),
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  language = LocaleKeys.languageCountryScreenArabic.tr();
                  //EasyLocalization.of(context)!.setLocale(const Locale('ar'));
                  cubit.emit(AuthenticationStatesRefreshState());
                },
                child: LanguageCountryItemBuilder(
                  image: 'assets/images/ksa-arabic.png',
                  text: LocaleKeys.languageCountryScreenArabic.tr(),
                  fontFamily: 'Cairo',
                  fontHeight: 1.0,
                  borderColor:
                      language == LocaleKeys.languageCountryScreenArabic.tr()
                          ? figmaPrimaryBlue
                          : figmaGrey1,
                ),
              ),
              SizedBox(height: 35.h),
              Text(
                LocaleKeys.languageCountryScreenChooseYourCountry.tr(),
                style: TextStyle(
                  color: figmaOurBlack,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.165,
                ),
              ),
              SizedBox(height: 22.h),
              GestureDetector(
                onTap: () {
                  country = LocaleKeys.languageCountryScreenBahrain.tr();
                  CacheHelper.setData(key: countryKey, value: 'Bahrain');
                  cubit.emit(AuthenticationStatesRefreshState());
                  navigateTo(widget: OnBoarding(), context: context);
                },
                child: LanguageCountryItemBuilder(
                  image: 'assets/images/bahrain.png',
                  text: LocaleKeys.languageCountryScreenBahrain.tr(),
                  borderColor:
                      country == LocaleKeys.languageCountryScreenBahrain.tr()
                          ? figmaPrimaryBlue
                          : figmaGrey1,
                ),
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  country = LocaleKeys.languageCountryScreenSaudiArabia.tr();
                  CacheHelper.setData(key: countryKey, value: 'Saudi Arabia');
                  cubit.emit(AuthenticationStatesRefreshState());
                  navigateTo(widget: OnBoarding(), context: context);
                },
                child: LanguageCountryItemBuilder(
                  image: 'assets/images/ksa-arabic.png',
                  text: LocaleKeys.languageCountryScreenSaudiArabia.tr(),
                  borderColor: country ==
                          LocaleKeys.languageCountryScreenSaudiArabia.tr()
                      ? figmaPrimaryBlue
                      : figmaGrey1,
                ),
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  country =
                      LocaleKeys.languageCountryScreenUnitedArabEmirates.tr();
                  CacheHelper.setData(
                      key: countryKey, value: 'United Arab Emirates');
                  cubit.emit(AuthenticationStatesRefreshState());
                  navigateTo(widget: OnBoarding(), context: context);
                },
                child: LanguageCountryItemBuilder(
                  image: 'assets/images/uae.png',
                  text: LocaleKeys.languageCountryScreenUnitedArabEmirates.tr(),
                  borderColor: country ==
                          LocaleKeys.languageCountryScreenUnitedArabEmirates
                              .tr()
                      ? figmaPrimaryBlue
                      : figmaGrey1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
