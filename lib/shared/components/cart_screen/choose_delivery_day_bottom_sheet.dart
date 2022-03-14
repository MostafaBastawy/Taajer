import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/styles/colors.dart';

class ChooseDeliveryDayBottomSheet extends StatelessWidget {
  const ChooseDeliveryDayBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.r),
        topRight: Radius.circular(30.r),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 0),
        width: 375.w,
        color: Colors.white,
        child: Column(
          children: [
            Text(
              'Choose Delivery Day',
              style: TextStyle(
                color: figmaOurBlack,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
            ),
            Expanded(
              child: CupertinoDatePicker(
                minimumDate: DateTime.now(),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime dateTime) {},
                backgroundColor: Colors.white,
                dateOrder: DatePickerDateOrder.dmy,
              ),
            ),
            DefaultButton(
              height: 48.h,
              width: 344.w,
              label: 'Submit',
              onPressed: () {},
              labelColor: Colors.white,
              labelWeight: FontWeight.w700,
              labelFontSize: 18.sp,
              labelFontHeight: 1.25,
              backGroundColor: figmaPrimaryBlue,
            ),
          ],
        ),
      ),
    );
  }
}
