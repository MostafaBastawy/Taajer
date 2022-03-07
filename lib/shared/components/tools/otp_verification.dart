import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taajer/shared/styles/colors.dart';

class DefaultOtpVerification extends StatelessWidget {
  var textEditingController = TextEditingController();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  Function? onCompleted;
  DefaultOtpVerification({
    Key? key,
    required this.onCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 49.w),
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(6),
          fieldHeight: 50,
          fieldWidth: 50,
          activeFillColor: Colors.white,
          activeColor: figmaPrimaryBlue,
          borderWidth: 1.0,
          inactiveColor: const Color(0xFFE2E4E8),
          inactiveFillColor: Colors.white,
          selectedColor: figmaPrimaryBlue,
          selectedFillColor: Colors.white,
        ),
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        errorAnimationController: errorController,
        controller: textEditingController,
        onCompleted: onCompleted!(),
        onChanged: (v) {},
      ),
    );
  }
}
