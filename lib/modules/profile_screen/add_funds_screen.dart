import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/modules/profile_screen/profile_cubit/profile_cubit.dart';
import 'package:taajer/modules/profile_screen/profile_cubit/profile_states.dart';
import 'package:taajer/shared/components/cart_screen/change_payment_method_builder.dart';
import 'package:taajer/shared/components/profile_screen/add_fund_amount_builder.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/styles/colors.dart';

class AddFundsScreen extends StatelessWidget {
  const AddFundsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = ProfileCubit.get(context);
    return BlocBuilder<ProfileCubit, ProfileStates>(
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
          title: const Text('Add Funds'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Align(
            alignment: AlignmentDirectional.topCenter,
            child: Column(
              children: [
                SizedBox(height: 37.h),
                Text(
                  'BHD',
                  style: TextStyle(
                    color: const Color(0xFF525C76),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 37.h),
                Text(
                  '50.',
                  style: TextStyle(
                    color: figmaOurBlack,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 36.sp,
                  ),
                ),
                SizedBox(height: 34.h),
                Row(
                  children: [
                    AddFundAmountBuilder(amount: '20.000'),
                    SizedBox(width: 10.w),
                    AddFundAmountBuilder(amount: '60.000'),
                    SizedBox(width: 10.w),
                    AddFundAmountBuilder(amount: '100.000'),
                  ],
                ),
                SizedBox(height: 33.h),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    'Payment Method',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                ChangePaymentMethodBuilder(),
                SizedBox(height: 38.h),
                DefaultButton(
                  height: 48.h,
                  width: 344.w,
                  label: 'Confirm',
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
        ),
      ),
    );
  }
}
