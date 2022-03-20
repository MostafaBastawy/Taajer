import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/modules/policies/policies_cubit/policies_cubit.dart';
import 'package:taajer/modules/policies/policies_cubit/policies_states.dart';
import 'package:taajer/shared/components/policies_screen/contact_us_builder_item.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

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
          title: const Text('Terms and Conditions'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
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
                      'Agreement To Terms',
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
              SizedBox(height: 32.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 16.h),
                width: 343.w,
                height: 302.h,
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
                      height: 72.h,
                      child: Text(
                        'In order to resolve a complaint regarding the Site or the Marketplace Offerings or to receive further information regarding use of the Site or the Marketplace Offerings, please contact us at:',
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
                    SizedBox(height: 12.h),
                    // Align(
                    //   alignment: AlignmentDirectional.topStart,
                    //   child: SvgPicture.asset(
                    //     'assets/images/policies_screen/address.svg',
                    //     width: 248.w,
                    //     height: 67.h,
                    //   ),
                    // ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/images/policies_screen/location-icon.svg',
                          width: 20.w,
                          height: 20.h,
                        ),
                        SizedBox(width: 12.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 4.w,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF525C76),
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'NBB Tower 15th floor, Office no. 15, Building 113',
                                  style: TextStyle(
                                    color: const Color(0xFF525C76),
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                Container(
                                  width: 4.w,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF525C76),
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'Road 838, Block 316',
                                  style: TextStyle(
                                    color: const Color(0xFF525C76),
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                Container(
                                  width: 4.w,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF525C76),
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'Manama, Capital Governorate',
                                  style: TextStyle(
                                    color: const Color(0xFF525C76),
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                Container(
                                  width: 4.w,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF525C76),
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'Kingdom of Bahrain',
                                  style: TextStyle(
                                    color: const Color(0xFF525C76),
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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
