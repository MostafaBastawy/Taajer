import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/modules/authentication/register/registeration2.dart';
import 'package:taajer/shared/components/authentication/register/business_item.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/components/tools/shared_preference/keys.dart';
import 'package:taajer/shared/components/tools/shared_preference/shared_preference.dart';
import 'package:taajer/shared/styles/colors.dart';

class RegisterScreen1 extends StatelessWidget {
  String? businessDetails = '';
  RegisterScreen1({Key? key}) : super(key: key);

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
            icon: const Icon(
              Icons.arrow_back_sharp,
            ),
          ),
          title: const Text('Business Details'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What is the type of your Business?',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  color: figmaOurBlack,
                  letterSpacing: -0.165,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: 22.h),
              GestureDetector(
                onTap: () {
                  businessDetails = 'Food Truck';
                  CacheHelper.setData(
                      key: businessDetailsKey, value: 'Food Truck');
                  cubit.emit(AuthenticationStatesRefreshState());
                  navigateTo(widget: RegisterScreen2(), context: context);
                },
                child: BusinessItemBuilder(
                  businessImage: 'assets/images/food-truck.svg',
                  businessType: 'Food Truck',
                  businessDescription: 'Food Truck',
                  borderColor: businessDetails == 'Food Truck'
                      ? figmaPrimaryBlue
                      : figmaGrey1,
                  borderBoxShadow: businessDetails == 'Food Truck'
                      ? borderActiveBoxShadow
                      : [],
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  businessDetails = 'Restaurant / Cafe';
                  CacheHelper.setData(
                      key: businessDetailsKey, value: 'Restaurant / Cafe');
                  cubit.emit(AuthenticationStatesRefreshState());
                  navigateTo(widget: RegisterScreen2(), context: context);
                },
                child: BusinessItemBuilder(
                  businessImage: 'assets/images/resturant-cafe.svg',
                  businessType: 'Restaurant / Cafe',
                  businessDescription: 'Food Truck',
                  borderColor: businessDetails == 'Restaurant / Cafe'
                      ? figmaPrimaryBlue
                      : figmaGrey1,
                  borderBoxShadow: businessDetails == 'Restaurant / Cafe'
                      ? borderActiveBoxShadow
                      : [],
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  businessDetails = 'Grocery Shop';
                  CacheHelper.setData(
                      key: businessDetailsKey, value: 'Grocery Shop');
                  cubit.emit(AuthenticationStatesRefreshState());
                  navigateTo(widget: RegisterScreen2(), context: context);
                },
                child: BusinessItemBuilder(
                  businessImage: 'assets/images/grocery.svg',
                  businessType: 'Grocery Shop',
                  businessDescription: 'Food Truck',
                  borderColor: businessDetails == 'Grocery Shop'
                      ? figmaPrimaryBlue
                      : figmaGrey1,
                  borderBoxShadow: businessDetails == 'Grocery Shop'
                      ? borderActiveBoxShadow
                      : [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
