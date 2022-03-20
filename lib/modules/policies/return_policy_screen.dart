import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReturnPolicyScreen extends StatelessWidget {
  const ReturnPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          SvgPicture.asset(
            'assets/images/search-icon.svg',
            width: 24.w,
            height: 24.h,
            color: const Color(0xFF3A4662),
          ),
          SizedBox(width: 16.w),
        ],
        title: const Text('Return Policy'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 25.h),
        child: SizedBox(
          width: 315.w,
          height: 287.h,
          child: Text(
            'Taajer takes user satisfaction very seriously. In the case of problems with your order, please contact Taajer through our live chat or call us on our hotline number and we will assist you. In appropriate cases, if you have already been billed by Taajer on behalf of the supplier, Taajer will issue full or partial refunds in your user account\'s digital wallet. In the following cases: if you did not receive your order or received an incorrect order, you may be issued a full refund to your user account\'s digital wallet; if part of your order is missing, we may issue a partial refund. In every event, we will do our best to ensure your satisfaction.',
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
    );
  }
}
