import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/modules/cart_screen/cart_cubit/cart_cubit.dart';
import 'package:taajer/modules/cart_screen/cart_cubit/cart_states.dart';
import 'package:taajer/modules/cart_screen/delivery_location.dart';
import 'package:taajer/shared/components/cart_screen/address_builder_item.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/styles/colors.dart';

class SelectAddress extends StatelessWidget {
  const SelectAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartCubit cubit = CartCubit.get(context);
    return BlocBuilder<CartCubit, CartStates>(
      builder: (BuildContext context, state) => Scaffold(
        appBar: AppBar(
          title: const Text('Select Address'),
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) =>
                            AddressBuilderItem(),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 12.h),
                        itemCount: 3,
                      ),
                    ],
                  ),
                ),
              ),
              DefaultButton(
                height: 48.h,
                width: 344.w,
                label: 'Add Address',
                onPressed: () {
                  navigateTo(
                    widget: DeliveryLocation(),
                    context: context,
                  );
                },
                labelColor: Colors.white,
                labelWeight: FontWeight.w700,
                labelFontSize: 18.sp,
                labelFontHeight: 1.25,
                backGroundColor: figmaPrimaryBlue,
              ),
              SizedBox(height: 25.h),
            ],
          ),
        ),
      ),
    );
  }
}
