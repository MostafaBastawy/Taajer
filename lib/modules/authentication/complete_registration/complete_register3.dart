import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/styles/colors.dart';

class CompleteRegistration3 extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  String? activeTextFormField;
  var businessNameController = TextEditingController();
  var certificateNumberController = TextEditingController();
  var searchLocationController = TextEditingController();
  var cityController = TextEditingController();
  var blockController = TextEditingController();
  var roadController = TextEditingController();
  var buildingController = TextEditingController();
  var shopOrOfficeController = TextEditingController();
  String businessNameValidationMessage = '';
  String certificateNumberValidationMessage = '';
  String searchLocationValidationMessage = '';
  String cityValidationMessage = '';
  String blockValidationMessage = '';
  String roadValidationMessage = '';
  String buildingValidationMessage = '';
  String shopOrOfficeValidationMessage = '';
  Color businessNameBorder = const Color(0xFFE2E4E8);
  Color certificateNumberBorder = const Color(0xFFE2E4E8);
  Color searchLocationBorder = const Color(0xFFE2E4E8);
  Color cityBorder = const Color(0xFFE2E4E8);
  Color blockBorder = const Color(0xFFE2E4E8);
  Color roadBorder = const Color(0xFFE2E4E8);
  Color buildingBorder = const Color(0xFFE2E4E8);
  Color shopOrOfficeBorder = const Color(0xFFE2E4E8);
  List<BoxShadow> businessNameShadowBorder = [];
  List<BoxShadow> certificateNumberShadowBorder = [];
  List<BoxShadow> searchLocationShadowBorder = [];
  List<BoxShadow> cityShadowBorder = [];
  List<BoxShadow> blockShadowBorder = [];
  List<BoxShadow> roadShadowBorder = [];
  List<BoxShadow> buildingShadowBorder = [];
  List<BoxShadow> shopOrOfficeShadowBorder = [];

  CompleteRegistration3({Key? key}) : super(key: key);

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
          title: const Text('Business Details'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 16.w),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          width: 343.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1.0,
                              color: activeTextFormField == 'Business Name'
                                  ? figmaActiveColor
                                  : businessNameBorder,
                            ),
                            borderRadius: BorderRadius.circular(6.r),
                            boxShadow: activeTextFormField == 'Business Name'
                                ? borderActiveBoxShadow
                                : businessNameShadowBorder,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: businessNameController,
                                  keyboardType: TextInputType.text,
                                  maxLines: 1,
                                  obscureText: false,
                                  onChanged: (value) {},
                                  onFieldSubmitted: (value) {},
                                  validator: (value) {},
                                  onTap: () {
                                    activeTextFormField = 'Business Name';
                                    cubit.emit(
                                        AuthenticationStatesRefreshState());
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Business Name',
                                    hintStyle: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFFB2B7C2),
                                      fontStyle: FontStyle.normal,
                                      height: 1.6,
                                    ),
                                  ),
                                ),
                              ),
                              if (activeTextFormField == 'Business Name')
                                GestureDetector(
                                  onTap: () {
                                    businessNameController.text = '';
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/delete-icon.svg',
                                    width: 16.67.w,
                                    height: 16.67.h,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if (businessNameValidationMessage.isNotEmpty)
                          SizedBox(height: 5.5.h),
                        if (businessNameValidationMessage.isNotEmpty)
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/error-icon.svg'),
                              SizedBox(width: 10.w),
                              Text(
                                businessNameValidationMessage,
                                style: TextStyle(
                                  color: const Color(0xFFFF3236),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 20.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          width: 343.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1.0,
                              color: activeTextFormField == 'Certificate Number'
                                  ? figmaActiveColor
                                  : certificateNumberBorder,
                            ),
                            borderRadius: BorderRadius.circular(6.r),
                            boxShadow:
                                activeTextFormField == 'Certificate Number'
                                    ? borderActiveBoxShadow
                                    : certificateNumberShadowBorder,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: certificateNumberController,
                                  keyboardType: TextInputType.text,
                                  maxLines: 1,
                                  obscureText: false,
                                  onChanged: (value) {},
                                  onFieldSubmitted: (value) {},
                                  validator: (value) {},
                                  onTap: () {
                                    activeTextFormField = 'Certificate Number';
                                    cubit.emit(
                                        AuthenticationStatesRefreshState());
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Certificate Number',
                                    hintStyle: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFFB2B7C2),
                                      fontStyle: FontStyle.normal,
                                      height: 1.6,
                                    ),
                                  ),
                                ),
                              ),
                              if (activeTextFormField == 'Certificate Number')
                                GestureDetector(
                                  onTap: () {
                                    businessNameController.text = '';
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/delete-icon.svg',
                                    width: 16.67.w,
                                    height: 16.67.h,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if (certificateNumberValidationMessage.isNotEmpty)
                          SizedBox(height: 5.5.h),
                        if (certificateNumberValidationMessage.isNotEmpty)
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/error-icon.svg'),
                              SizedBox(width: 10.w),
                              Text(
                                certificateNumberValidationMessage,
                                style: TextStyle(
                                  color: const Color(0xFFFF3236),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 20.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          width: 343.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1.0,
                              color: activeTextFormField == 'City'
                                  ? figmaActiveColor
                                  : cityBorder,
                            ),
                            borderRadius: BorderRadius.circular(6.r),
                            boxShadow: activeTextFormField == 'City'
                                ? borderActiveBoxShadow
                                : cityShadowBorder,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: cityController,
                                  keyboardType: TextInputType.text,
                                  maxLines: 1,
                                  obscureText: false,
                                  onChanged: (value) {},
                                  onFieldSubmitted: (value) {},
                                  validator: (value) {},
                                  onTap: () {
                                    activeTextFormField = 'City';
                                    cubit.emit(
                                        AuthenticationStatesRefreshState());
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'City',
                                    hintStyle: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFFB2B7C2),
                                      fontStyle: FontStyle.normal,
                                      height: 1.6,
                                    ),
                                  ),
                                ),
                              ),
                              if (activeTextFormField == 'City')
                                GestureDetector(
                                  onTap: () {
                                    cityController.text = '';
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/delete-icon.svg',
                                    width: 16.67.w,
                                    height: 16.67.h,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if (cityValidationMessage.isNotEmpty)
                          SizedBox(height: 5.5.h),
                        if (cityValidationMessage.isNotEmpty)
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/error-icon.svg'),
                              SizedBox(width: 10.w),
                              Text(
                                cityValidationMessage,
                                style: TextStyle(
                                  color: const Color(0xFFFF3236),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.w),
                                    height: 45.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 1.0,
                                        color: activeTextFormField == 'Block'
                                            ? figmaActiveColor
                                            : blockBorder,
                                      ),
                                      borderRadius: BorderRadius.circular(6.r),
                                      boxShadow: activeTextFormField == 'Block'
                                          ? borderActiveBoxShadow
                                          : blockShadowBorder,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: blockController,
                                            keyboardType: TextInputType.text,
                                            maxLines: 1,
                                            obscureText: false,
                                            onChanged: (value) {},
                                            onFieldSubmitted: (value) {},
                                            validator: (value) {},
                                            onTap: () {
                                              activeTextFormField = 'Block';
                                              cubit.emit(
                                                  AuthenticationStatesRefreshState());
                                            },
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Block',
                                              hintStyle: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFFB2B7C2),
                                                fontStyle: FontStyle.normal,
                                                height: 1.6,
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (activeTextFormField == 'Block')
                                          GestureDetector(
                                            onTap: () {
                                              blockController.text = '';
                                            },
                                            child: SvgPicture.asset(
                                              'assets/images/delete-icon.svg',
                                              width: 16.67.w,
                                              height: 16.67.h,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  if (blockValidationMessage.isNotEmpty)
                                    SizedBox(height: 5.5.h),
                                  if (blockValidationMessage.isNotEmpty)
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/error-icon.svg'),
                                        SizedBox(width: 10.w),
                                        Text(
                                          blockValidationMessage,
                                          style: TextStyle(
                                            color: const Color(0xFFFF3236),
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(width: 19.w),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.w),
                                    height: 45.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 1.0,
                                        color: activeTextFormField == 'Road'
                                            ? figmaActiveColor
                                            : roadBorder,
                                      ),
                                      borderRadius: BorderRadius.circular(6.r),
                                      boxShadow: activeTextFormField == 'Road'
                                          ? borderActiveBoxShadow
                                          : roadShadowBorder,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: roadController,
                                            keyboardType: TextInputType.text,
                                            maxLines: 1,
                                            obscureText: false,
                                            onChanged: (value) {},
                                            onFieldSubmitted: (value) {},
                                            validator: (value) {},
                                            onTap: () {
                                              activeTextFormField = 'Road';
                                              cubit.emit(
                                                  AuthenticationStatesRefreshState());
                                            },
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Road',
                                              hintStyle: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFFB2B7C2),
                                                fontStyle: FontStyle.normal,
                                                height: 1.6,
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (activeTextFormField == 'Road')
                                          GestureDetector(
                                            onTap: () {
                                              roadController.text = '';
                                            },
                                            child: SvgPicture.asset(
                                              'assets/images/delete-icon.svg',
                                              width: 16.67.w,
                                              height: 16.67.h,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  if (roadValidationMessage.isNotEmpty)
                                    SizedBox(height: 5.5.h),
                                  if (roadValidationMessage.isNotEmpty)
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/error-icon.svg'),
                                        SizedBox(width: 10.w),
                                        Text(
                                          roadValidationMessage,
                                          style: TextStyle(
                                            color: const Color(0xFFFF3236),
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.w),
                                    height: 45.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 1.0,
                                        color: activeTextFormField == 'Building'
                                            ? figmaActiveColor
                                            : buildingBorder,
                                      ),
                                      borderRadius: BorderRadius.circular(6.r),
                                      boxShadow:
                                          activeTextFormField == 'Building'
                                              ? borderActiveBoxShadow
                                              : buildingShadowBorder,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: buildingController,
                                            keyboardType: TextInputType.text,
                                            maxLines: 1,
                                            obscureText: false,
                                            onChanged: (value) {},
                                            onFieldSubmitted: (value) {},
                                            validator: (value) {},
                                            onTap: () {
                                              activeTextFormField = 'Building';
                                              cubit.emit(
                                                  AuthenticationStatesRefreshState());
                                            },
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Building',
                                              hintStyle: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFFB2B7C2),
                                                fontStyle: FontStyle.normal,
                                                height: 1.6,
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (activeTextFormField == 'Building')
                                          GestureDetector(
                                            onTap: () {
                                              buildingController.text = '';
                                            },
                                            child: SvgPicture.asset(
                                              'assets/images/delete-icon.svg',
                                              width: 16.67.w,
                                              height: 16.67.h,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  if (buildingValidationMessage.isNotEmpty)
                                    SizedBox(height: 5.5.h),
                                  if (buildingValidationMessage.isNotEmpty)
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/error-icon.svg'),
                                        SizedBox(width: 10.w),
                                        Text(
                                          buildingValidationMessage,
                                          style: TextStyle(
                                            color: const Color(0xFFFF3236),
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(width: 19.w),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.w),
                                    height: 45.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 1.0,
                                        color:
                                            activeTextFormField == 'Shop/Office'
                                                ? figmaActiveColor
                                                : shopOrOfficeBorder,
                                      ),
                                      borderRadius: BorderRadius.circular(6.r),
                                      boxShadow:
                                          activeTextFormField == 'Shop/Office'
                                              ? borderActiveBoxShadow
                                              : shopOrOfficeShadowBorder,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: shopOrOfficeController,
                                            keyboardType: TextInputType.text,
                                            maxLines: 1,
                                            obscureText: false,
                                            onChanged: (value) {},
                                            onFieldSubmitted: (value) {},
                                            validator: (value) {},
                                            onTap: () {
                                              activeTextFormField =
                                                  'Shop/Office';
                                              cubit.emit(
                                                  AuthenticationStatesRefreshState());
                                            },
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Shop/Office',
                                              hintStyle: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFFB2B7C2),
                                                fontStyle: FontStyle.normal,
                                                height: 1.6,
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (activeTextFormField ==
                                            'Shop/Office')
                                          GestureDetector(
                                            onTap: () {
                                              shopOrOfficeController.text = '';
                                            },
                                            child: SvgPicture.asset(
                                              'assets/images/delete-icon.svg',
                                              width: 16.67.w,
                                              height: 16.67.h,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  if (shopOrOfficeValidationMessage.isNotEmpty)
                                    SizedBox(height: 5.5.h),
                                  if (shopOrOfficeValidationMessage.isNotEmpty)
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/error-icon.svg'),
                                        SizedBox(width: 10.w),
                                        Text(
                                          shopOrOfficeValidationMessage,
                                          style: TextStyle(
                                            color: const Color(0xFFFF3236),
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                DefaultButton(
                  height: 45.h,
                  width: 343.w,
                  label: 'Next',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.emit(AuthenticationStatesRefreshState());
                    }
                  },
                  labelColor: Colors.white,
                  labelWeight: FontWeight.w400,
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
