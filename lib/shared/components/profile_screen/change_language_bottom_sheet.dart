import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/shared/components/authentication/register/language_country_item.dart';
import 'package:taajer/shared/styles/colors.dart';
import 'package:taajer/translations/locale_keys.g.dart';

class ChangeLanguageBottomSheet extends StatelessWidget {
  const ChangeLanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(),
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            width: 375.w,
            height: 230.h,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Text(
                  'Change language',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: figmaOurBlack,
                    fontStyle: FontStyle.normal,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 38.h),
                LanguageCountryItemBuilder(
                  image: 'assets/images/us-english.png',
                  text: 'English',
                  borderColor: figmaGrey1,
                ),
                SizedBox(height: 10.h),
                LanguageCountryItemBuilder(
                  image: 'assets/images/ksa-arabic.png',
                  text: LocaleKeys.languageCountryScreenArabic.tr(),
                  fontFamily: 'Cairo',
                  fontHeight: 1.0,
                  borderColor: figmaGrey1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
