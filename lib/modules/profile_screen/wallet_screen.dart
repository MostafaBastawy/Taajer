import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/modules/profile_screen/add_funds_screen.dart';
import 'package:taajer/modules/profile_screen/profile_cubit/profile_cubit.dart';
import 'package:taajer/modules/profile_screen/profile_cubit/profile_states.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/styles/colors.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

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
          title: const Text('Wallet'),
        ),
        body: Align(
          alignment: AlignmentDirectional.topCenter,
          child: Column(
            children: [
              SizedBox(height: 68.h),
              Text(
                'Available Credit',
                style: TextStyle(
                  color: const Color(0xFF525C76),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 68.h),
              Text(
                'BHD 0.000',
                style: TextStyle(
                  color: figmaOurBlack,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 36.sp,
                ),
              ),
              SizedBox(height: 67.h),
              GestureDetector(
                onTap: () {
                  navigateTo(widget: AddFundsScreen(), context: context);
                },
                child: Container(
                  width: 161.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      width: 1.0,
                      color: figmaPrimaryBlue,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/profile_screen/plus-icon.svg',
                        width: 20.w,
                        height: 20.h,
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        'Add Funds',
                        style: TextStyle(
                          color: figmaPrimaryBlue,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
