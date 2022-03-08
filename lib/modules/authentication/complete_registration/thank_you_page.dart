import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/modules/home_layout.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/styles/colors.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        child: Column(
          children: [
            SizedBox(height: 80.h),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image(
                  image: const AssetImage('assets/images/thank-you1.jpg'),
                  width: 313.w,
                  height: 266.h,
                ),
                Image(
                  image: const AssetImage('assets/images/thank-you2.jpg'),
                  width: 100.w,
                  height: 100.h,
                ),
              ],
            ),
            SizedBox(height: 33.h),
            Text(
              'Thank you',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: figmaOurBlack,
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              width: 300.w,
              child: Text(
                'We have received your user verification request, our team will verify your details and notify you.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  color: figmaShade1,
                  height: 1.3,
                ),
              ),
            ),
            const Spacer(),
            DefaultButton(
              height: 45.h,
              width: 343.w,
              label: 'Browse Products',
              onPressed: () {
                navigateTo(
                  widget: HomeLayout(),
                  context: context,
                );
              },
              labelColor: Colors.white,
              labelWeight: FontWeight.w400,
              backGroundColor: figmaPrimaryBlue,
            ),
          ],
        ),
      ),
    );
  }
}
