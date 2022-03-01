import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/shared/components/authentication/register/business_item.dart';
import 'package:taajer/shared/styles/colors.dart';

class RegisterScreen1 extends StatelessWidget {
  const RegisterScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationCubit cubit = AuthenticationCubit.get(context);
    return BlocBuilder<AuthenticationCubit, AuthenticationStates>(
      builder: (BuildContext context, state) => Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_sharp,
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
              BusinessItemBuilder(
                businessImage: 'assets/images/food-truck.svg',
                businessType: 'Food Truck',
                businessDescription: 'Food Truck',
              ),
              SizedBox(height: 20.h),
              BusinessItemBuilder(
                businessImage: 'assets/images/resturant-cafe.svg',
                businessType: 'Restaurant / Cafe',
                businessDescription: 'Food Truck',
              ),
              SizedBox(height: 20.h),
              BusinessItemBuilder(
                businessImage: 'assets/images/grocery.svg',
                businessType: 'Grocery Shop',
                businessDescription: 'Food Truck',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
