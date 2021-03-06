import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/modules/authentication/register/language_country_selection.dart';
import 'package:taajer/modules/profile_screen/my_addresses_screen.dart';
import 'package:taajer/modules/profile_screen/profile_change_password_screen.dart';
import 'package:taajer/modules/profile_screen/wallet_screen.dart';
import 'package:taajer/shared/components/profile_screen/change_country_bottom_sheet.dart';
import 'package:taajer/shared/components/profile_screen/change_language_bottom_sheet.dart';
import 'package:taajer/shared/components/profile_screen/profile_screen_item.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/components/tools/shared_preference/keys.dart';
import 'package:taajer/shared/components/tools/shared_preference/shared_preference.dart';
import 'package:taajer/shared/styles/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/images/arrow-left-icon.svg',
            height: 32.h,
            width: 32.w,
          ),
        ),
        title: const Text('Business Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            ProfileScreenBuilderItem(
              itemIcon:
                  'assets/images/profile_screen/business-details-icon.svg',
              itemTitle: 'Business Details',
              itemValue: 'Business Name',
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                navigateTo(widget: MyAddressesScreen(), context: context);
              },
              child: ProfileScreenBuilderItem(
                itemIcon: 'assets/images/profile_screen/saved-address-icon.svg',
                itemTitle: 'Saved Addresses',
                itemValue: '4',
              ),
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                navigateTo(widget: WalletScreen(), context: context);
              },
              child: ProfileScreenBuilderItem(
                itemIcon: 'assets/images/profile_screen/wallet-icon.svg',
                itemTitle: 'Wallet',
                itemValue: 'BHD 0.000',
              ),
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                navigateTo(
                    widget: ProfileChangePasswordScreen(), context: context);
              },
              child: ProfileScreenBuilderItem(
                itemIcon:
                    'assets/images/profile_screen/change-password-icon.svg',
                itemTitle: 'Change Password',
                itemValue: '********',
              ),
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                showBottomSheet(
                    elevation: 0.0,
                    backgroundColor: Colors.black.withOpacity(0.7),
                    context: context,
                    builder: (BuildContext context) =>
                        ChangeLanguageBottomSheet());
              },
              child: ProfileScreenBuilderItem(
                itemIcon: 'assets/images/profile_screen/language-icon.svg',
                itemTitle: 'Language',
                itemValue: 'English',
              ),
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                showBottomSheet(
                  elevation: 0.0,
                  backgroundColor: Colors.black.withOpacity(0.7),
                  context: context,
                  builder: (BuildContext context) => ChangeCountryBottomSheet(),
                );
              },
              child: ProfileScreenBuilderItem(
                itemIcon: 'assets/images/profile_screen/country-icon.svg',
                itemTitle: 'Country',
                itemValue: 'Bahrain',
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: 344.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(
                  width: 1.0,
                  color: figmaPrimaryBlue,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/profile_screen/support-icon.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Support',
                    style: TextStyle(
                      color: figmaPrimaryBlue,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 37.h),
            GestureDetector(
              onTap: () {
                CacheHelper.removeData(key: accessTokenKey);
                navigateAndFinish(
                  widget: LanguageCountryScreen(),
                  context: context,
                );
              },
              child: SizedBox(
                width: 66.w,
                child: Text(
                  'Sign out',
                  style: TextStyle(
                    color: const Color(0xFFA4A5A9),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
