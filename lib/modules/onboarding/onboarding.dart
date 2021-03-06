import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/modules/authentication/login/login_screen1.dart';
import 'package:taajer/modules/authentication/register/registeration1.dart';
import 'package:taajer/shared/components/onboarding/onboarding_item.dart';
import 'package:taajer/shared/components/onboarding/onboarding_list.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/styles/colors.dart';

class OnBoarding extends StatelessWidget {
  var onBoardingController = PageController();
  bool lastPage = false;
  OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationCubit cubit = AuthenticationCubit.get(context);
    return BlocBuilder<AuthenticationCubit, AuthenticationStates>(
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
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemBuilder: (BuildContext context, int index) =>
                      OnBoardingItemBuilder(
                    onBoardingModel: onBoarding[index],
                  ),
                  itemCount: onBoarding.length,
                  controller: onBoardingController,
                  onPageChanged: (int index) {
                    if (index == onBoarding.length - 1) {
                      lastPage = true;
                      cubit.emit(AuthenticationStatesRefreshState());
                    }
                  },
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: SmoothPageIndicator(
                  controller: onBoardingController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotColor: Color(0xAFA8C8FF),
                    dotHeight: 5,
                    expansionFactor: 2,
                    dotWidth: 10.59,
                    spacing: 8.24,
                    activeDotColor: figmaPrimaryBlue,
                  ),
                ),
              ),
              SizedBox(height: 51.h),
              if (lastPage == false)
                Row(
                  children: [
                    DefaultButton(
                      height: 46.h,
                      width: 162.w,
                      label: 'Skip',
                      onPressed: () {
                        navigateTo(
                          widget: RegisterScreen1(),
                          context: context,
                        );
                      },
                      labelColor: figmaPrimaryBlue,
                      labelWeight: FontWeight.w700,
                      backGroundColor: Colors.white,
                    ),
                    SizedBox(width: 18.w),
                    DefaultButton(
                      height: 46.h,
                      width: 162.w,
                      label: 'Sign In',
                      onPressed: () {
                        navigateTo(
                          widget: LoginScreen1(),
                          context: context,
                        );
                      },
                      labelColor: Colors.white,
                      labelWeight: FontWeight.w700,
                      backGroundColor: figmaPrimaryBlue,
                    ),
                  ],
                ),
              if (lastPage == true)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  width: 344.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: figmaPrimaryBlue,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          navigateTo(
                            widget: RegisterScreen1(),
                            context: context,
                          );
                        },
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.25,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 95.12.w,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 37.h),
            ],
          ),
        ),
      ),
    );
  }
}
