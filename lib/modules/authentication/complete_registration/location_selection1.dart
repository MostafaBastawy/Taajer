import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/modules/authentication/complete_registration/thank_you_page.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/styles/colors.dart';

class LocationSelection1 extends StatelessWidget {
  var searchLocationController = TextEditingController();

  LocationSelection1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationCubit cubit = AuthenticationCubit.get(context);
    return BlocConsumer<AuthenticationCubit, AuthenticationStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
            ),
          ),
          title: const Text('Business Location'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 16.w),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                width: 343.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFFE2E4E8),
                  ),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: searchLocationController,
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        obscureText: false,
                        onChanged: (value) {},
                        onFieldSubmitted: (value) {},
                        validator: (value) {},
                        onTap: () {},
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search Location',
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFB2B7C2),
                            fontStyle: FontStyle.normal,
                            height: 1.6,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              DefaultButton(
                height: 45.h,
                width: 343.w,
                label: 'Next',
                onPressed: () {
                  navigateTo(
                    widget: ThankYouPage(),
                    context: context,
                  );
                },
                labelColor: Colors.white,
                labelWeight: FontWeight.w400,
                backGroundColor: figmaPrimaryBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
