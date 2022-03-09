import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/shared/components/profile_screen/profile_screen_item.dart';
import 'package:taajer/shared/styles/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
          ),
        ),
        title: const Text('Business Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 16.w),
        child: Column(
          children: [
            ProfileScreenBuilderItem(
              itemIcon:
                  'assets/images/profile_screen/business-details-icon.svg',
              itemTitle: 'Business Details',
              itemValue: 'Business Name',
            ),
            SizedBox(height: 10.h),
            ProfileScreenBuilderItem(
              itemIcon: 'assets/images/profile_screen/saved-address-icon.svg',
              itemTitle: 'Saved Addresses',
              itemValue: '4',
            ),
            SizedBox(height: 10.h),
            ProfileScreenBuilderItem(
              itemIcon: 'assets/images/profile_screen/wallet-icon.svg',
              itemTitle: 'Wallet',
              itemValue: 'BHD 0.000',
            ),
            SizedBox(height: 10.h),
            ProfileScreenBuilderItem(
              itemIcon: 'assets/images/profile_screen/change-password-icon.svg',
              itemTitle: 'Change Password',
              itemValue: '********',
            ),
            SizedBox(height: 10.h),
            ProfileScreenBuilderItem(
              itemIcon: 'assets/images/profile_screen/language-icon.svg',
              itemTitle: 'Language',
              itemValue: 'English',
            ),
            SizedBox(height: 10.h),
            ProfileScreenBuilderItem(
              itemIcon: 'assets/images/profile_screen/country-icon.svg',
              itemTitle: 'Country',
              itemValue: 'Bahrain',
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
          ],
        ),
      ),
    );
  }
}
