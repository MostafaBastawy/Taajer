import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/styles/colors.dart';

class CompleteRegistration2 extends StatelessWidget {
  double sliderValue = 10000;
  CompleteRegistration2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationCubit cubit = AuthenticationCubit.get(context);
    return BlocConsumer<AuthenticationCubit, AuthenticationStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
            ),
          ),
          title: const Text('Business Details'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 25,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Annual Revenue',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              SfSliderTheme(
                data: SfSliderThemeData(
                  tooltipBackgroundColor: figmaPrimaryBlue,
                  tooltipTextStyle: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    fontSize: 10.sp,
                  ),
                  thumbRadius: 12.5.r,
                  thumbColor: figmaPrimaryBlue,
                  thumbStrokeColor: Colors.red,
                  activeTrackHeight: 4.h,
                  activeTrackColor: figmaPrimaryBlue,
                  inactiveTrackHeight: 2.h,
                  inactiveTrackColor: const Color(0xFFCACDD5),
                  trackCornerRadius: 3.r,
                  overlayRadius: 16.r,
                ),
                child: SfSlider(
                  min: 10000,
                  max: 100000,
                  value: sliderValue.toInt(),
                  enableTooltip: true,
                  activeColor: figmaPrimaryBlue,
                  inactiveColor: const Color(0xFFCACDD5),
                  tooltipShape: const SfPaddleTooltipShape(),
                  shouldAlwaysShowTooltip: true,
                  onChanged: (value) {
                    sliderValue = value;
                    cubit.emit(AuthenticationStatesRefreshState());
                  },
                ),
              ),
              // Slider(
              //   thumbColor: figmaPrimaryBlue,
              //   label: sliderValue.toString(),
              //   value: sliderValue,
              //   onChanged: (value) {
              //     sliderValue = value;
              //     cubit.emit(AuthenticationStatesRefreshState());
              //   },
              //   min: 10000,
              //   max: 100000,
              //   inactiveColor: const Color(0xFFCACDD5),
              //   activeColor: figmaPrimaryBlue,
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Text(
                      'BHD 10,000',
                      style: TextStyle(
                        color: figmaOurBlack,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'BHD 100,000+',
                      style: TextStyle(
                        color: figmaOurBlack,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 52.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Submit Official Documents',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              DottedBorder(
                radius: Radius.circular(12.r),
                color: const Color(0xFFE2E4E8),
                borderType: BorderType.RRect,
                padding: const EdgeInsets.all(1),
                strokeWidth: 1,
                dashPattern: const [5, 5],
                child: Container(
                  width: 343.w,
                  height: 188.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: const Color(0xFFF9F8FF),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.08),
                        offset: (Offset(0, 1)),
                        blurRadius: 1,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Commercial Certificate',
                        style: TextStyle(
                          color: figmaPrimaryBlue,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Text(
                        'PDF format only',
                        style: TextStyle(
                          color: figmaGrey1,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Container(
                        height: 31.h,
                        width: 124.w,
                        decoration: BoxDecoration(
                          color: figmaPrimaryBlue,
                          borderRadius: BorderRadius.circular(6.r),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.08),
                              offset: (Offset(0, 1)),
                              blurRadius: 1,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/upload-icon.svg',
                            ),
                            SizedBox(width: 8.67.w),
                            Text(
                              'Browse Files',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                'By clicking “Submit” you agree to our',
                style: TextStyle(
                  color: figmaOurBlack,
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const SizedBox(height: 3.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Terms and Conditions',
                    style: TextStyle(
                      color: figmaPrimaryBlue,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Text(
                    ' and ',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: figmaPrimaryBlue,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Text(
                    '.',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              DefaultButton(
                height: 45.h,
                width: 343.w,
                label: 'Submit',
                onPressed: () {},
                labelColor: Colors.white,
                labelWeight: FontWeight.w400,
                backGroundColor: figmaPrimaryBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
