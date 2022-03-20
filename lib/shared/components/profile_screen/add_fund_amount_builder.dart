import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddFundAmountBuilder extends StatelessWidget {
  String? amount;
  AddFundAmountBuilder({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 31.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            width: 1.0,
            style: BorderStyle.solid,
            color: const Color(0xFFE2E4E8),
          ),
        ),
        child: Center(
          child: Text(
            amount!,
            style: TextStyle(
              color: const Color(0xFF525C76),
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
