import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/shared/components/authentication/register/language_country_item.dart';
import 'package:taajer/shared/styles/colors.dart';

class LanguageCountryScreen extends StatelessWidget {
  const LanguageCountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationCubit cubit = AuthenticationCubit.get(context);
    return BlocBuilder<AuthenticationCubit, AuthenticationStates>(
      builder: (BuildContext context, state) => Scaffold(
        appBar: null,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 79.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose Your Language',
                style: TextStyle(
                  color: figmaOurBlack,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.165,
                ),
              ),
              SizedBox(height: 22.h),
              LanguageCountryItemBuilder(
                image: 'assets/images/us-english.png',
                text: 'English',
              ),
              SizedBox(height: 10.h),
              LanguageCountryItemBuilder(
                image: 'assets/images/ksa-arabic.png',
                text: 'اللغة العربية',
                fontFamily: 'Cairo',
                fontHeight: 1.0,
              ),
              SizedBox(height: 35.h),
              Text(
                'Choose Your Country',
                style: TextStyle(
                  color: figmaOurBlack,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.165,
                ),
              ),
              SizedBox(height: 22.h),
              LanguageCountryItemBuilder(
                image: 'assets/images/bahrain.png',
                text: 'Bahrain',
              ),
              SizedBox(height: 10.h),
              LanguageCountryItemBuilder(
                image: 'assets/images/ksa-arabic.png',
                text: 'Saudi Arabia',
              ),
              SizedBox(height: 10.h),
              LanguageCountryItemBuilder(
                image: 'assets/images/uae.png',
                text: 'United Arab Emirates',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
