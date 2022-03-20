import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/modules/policies/policies_cubit/policies_cubit.dart';
import 'package:taajer/modules/policies/policies_cubit/policies_states.dart';
import 'package:taajer/shared/components/policies_screen/contact_us_builder_item.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PoliciesCubit cubit = PoliciesCubit.get(context);
    return BlocBuilder<PoliciesCubit, PoliciesStates>(
      builder: (BuildContext context, state) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              'assets/images/arrow-left-icon.svg',
              height: 32.h,
              width: 32.w,
            ),
          ),
          title: const Text('Privacy Policy'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 25.h),
                child: SizedBox(
                  width: 315.w,
                  child: Text(
                    'This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You. We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy.',
                    style: TextStyle(
                      color: const Color(0xFF525C76),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 13.sp,
                      height: 1.21,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 13.w),
                width: 343.w,
                height: 52.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFB),
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(
                    width: 1.0,
                    style: BorderStyle.solid,
                    color: const Color(0xFFE2E4E8),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'Interpretation and Definitions',
                      style: TextStyle(
                        color: const Color(0xFF525C76),
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 15.sp,
                        height: 1.20,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/images/policies_screen/plus-icon.svg',
                      height: 24.h,
                      width: 24.w,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 16.h),
                width: 343.w,
                height: 196.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFB),
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(
                    width: 1.0,
                    style: BorderStyle.solid,
                    color: const Color(0xFFE2E4E8),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Contact Us',
                          style: TextStyle(
                            color: const Color(0xFF525C76),
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 15.sp,
                            height: 1.20,
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          'assets/images/policies_screen/minus-icon.svg',
                          height: 24.h,
                          width: 24.w,
                        ),
                      ],
                    ),
                    SizedBox(height: 18.h),
                    SizedBox(
                      height: 36.h,
                      child: Text(
                        'If you have any questions about this Privacy Policy, You can contact us using the following channels:',
                        style: TextStyle(
                          color: const Color(0xFFB2B7C2),
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.sp,
                          height: 1.18,
                        ),
                      ),
                    ),
                    SizedBox(height: 19.h),
                    ContactUsBuilderItem(
                      icon: 'assets/images/policies_screen/mail-icon.svg',
                      value: 'info@taajer.net',
                    ),
                    SizedBox(height: 12.h),
                    ContactUsBuilderItem(
                      icon: 'assets/images/policies_screen/phone-icon.svg',
                      value: '+973 32320632',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
