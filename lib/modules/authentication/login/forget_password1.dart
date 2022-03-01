import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/modules/authentication/login/forget_password2.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/styles/colors.dart';

class ForgetPassword1 extends StatelessWidget {
  var passwordController = TextEditingController();
  ForgetPassword1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationCubit cubit = AuthenticationCubit.get(context);

    return BlocBuilder<AuthenticationCubit, AuthenticationStates>(
      builder: (BuildContext context, state) => Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_sharp,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password?',
                style: TextStyle(
                  color: figmaOurBlack,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.165,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Don’t Worry! It happens, Please enter your',
                style: TextStyle(
                  color: const Color(0xFF76777E),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.165,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'phone number to reset your password.',
                style: TextStyle(
                  color: const Color(0xFF76777E),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.165,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: 26.h),
              const Spacer(),
              DefaultButton(
                height: 46.h,
                width: 344.w,
                label: 'Send Code',
                onPressed: () {
                  navigateTo(
                    widget: ForgetPassword2(),
                    context: context,
                  );
                },
                labelColor: Colors.white,
                labelWeight: FontWeight.w700,
                backGroundColor: figmaPrimaryBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
