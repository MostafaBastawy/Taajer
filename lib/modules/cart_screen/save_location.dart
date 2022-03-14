import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taajer/app_cubit/app_cubit.dart';
import 'package:taajer/modules/cart_screen/cart_cubit/cart_cubit.dart';
import 'package:taajer/modules/cart_screen/cart_cubit/cart_states.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/components/tools/shared_preference/keys.dart';
import 'package:taajer/shared/components/tools/shared_preference/shared_preference.dart';
import 'package:taajer/shared/patterns.dart';
import 'package:taajer/shared/styles/colors.dart';

class SaveLocation extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  String? countryFlag;
  String? countryCode;
  String? activeTextFormField;
  var addressNameController = TextEditingController();
  var cityController = TextEditingController();
  var blockController = TextEditingController();
  var roadController = TextEditingController();
  var buildingController = TextEditingController();
  var shopOrOfficeController = TextEditingController();
  var phoneNumberController = TextEditingController();
  String addressNameValidationMessage = '';
  String cityValidationMessage = '';
  String blockValidationMessage = '';
  String roadValidationMessage = '';
  String buildingValidationMessage = '';
  String shopOrOfficeValidationMessage = '';
  String phoneNumberValidationMessage = '';
  Color addressNameBorder = const Color(0xFFE2E4E8);
  Color cityBorder = const Color(0xFFE2E4E8);
  Color blockBorder = const Color(0xFFE2E4E8);
  Color roadBorder = const Color(0xFFE2E4E8);
  Color buildingBorder = const Color(0xFFE2E4E8);
  Color shopOrOfficeBorder = const Color(0xFFE2E4E8);
  Color phoneNumberBorder = const Color(0xFFE2E4E8);
  List<BoxShadow> addressNameShadowBorder = [];
  List<BoxShadow> cityShadowBorder = [];
  List<BoxShadow> blockShadowBorder = [];
  List<BoxShadow> roadShadowBorder = [];
  List<BoxShadow> buildingShadowBorder = [];
  List<BoxShadow> shopOrOfficeShadowBorder = [];
  List<BoxShadow> phoneNumberShadowBorder = [];
  SaveLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartCubit cubit = CartCubit.get(context);
    if (CacheHelper.getData(key: countryKey) == 'Bahrain') {
      countryFlag = 'bahrain.png';
      countryCode = '+973';
    } else if (CacheHelper.getData(key: countryKey) == 'Saudi Arabia') {
      countryFlag = 'ksa-arabic.png';
      countryCode = '+966';
    } else {
      countryFlag = 'uae.png';
      countryCode = '+971';
    }
    return BlocBuilder<CartCubit, CartStates>(
      builder: (BuildContext context, state) => Scaffold(
        appBar: AppBar(
          title: const Text('New Address'),
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            SizedBox(
                              width: 343.w,
                              height: 211.h,
                              child: Align(
                                alignment: AlignmentDirectional.topCenter,
                                child: Container(
                                  width: 343.w,
                                  height: 192.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 1.0,
                                      color: const Color(0xFFE2E4E8),
                                    ),
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: GoogleMap(
                                    mapType: MapType.normal,
                                    myLocationButtonEnabled: false,
                                    zoomControlsEnabled: false,
                                    zoomGesturesEnabled: true,
                                    myLocationEnabled: true,
                                    onMapCreated:
                                        (GoogleMapController controller) {},
                                    initialCameraPosition: CameraPosition(
                                      target: LatLng(
                                        AppCubit.get(context)
                                            .currentUserLatLng!
                                            .latitude,
                                        AppCubit.get(context)
                                            .currentUserLatLng!
                                            .longitude,
                                      ),
                                      zoom: 14.47460,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 156.w,
                              height: 38.h,
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 1.0,
                                  color: figmaPrimaryBlue,
                                ),
                                borderRadius: BorderRadius.circular(6.r),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 2),
                                    color: Color.fromRGBO(0, 0, 0, 0.08),
                                    blurRadius: 3,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/cart_screen/refine-location-icon.svg',
                                    width: 20.w,
                                    height: 20.h,
                                    color: figmaPrimaryBlue,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    'Refine Location',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: figmaPrimaryBlue,
                                      fontStyle: FontStyle.normal,
                                      height: 1.6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          width: 343.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1.0,
                              color: activeTextFormField == 'Address Nickname'
                                  ? figmaActiveColor
                                  : addressNameBorder,
                            ),
                            borderRadius: BorderRadius.circular(6.r),
                            boxShadow: activeTextFormField == 'Address Nickname'
                                ? borderActiveBoxShadow
                                : addressNameShadowBorder,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: addressNameController,
                                  keyboardType: TextInputType.text,
                                  maxLines: 1,
                                  obscureText: false,
                                  onChanged: (value) {},
                                  onFieldSubmitted: (value) {},
                                  validator: (value) {},
                                  onTap: () {
                                    activeTextFormField = 'Address Nickname';
                                    cubit.emit(CartStatesRefreshState());
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Address Nickname',
                                    hintStyle: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFB2B7C2),
                                      fontStyle: FontStyle.normal,
                                      height: 1.6,
                                    ),
                                  ),
                                ),
                              ),
                              if (activeTextFormField == 'Address Nickname')
                                GestureDetector(
                                  onTap: () {
                                    addressNameController.text = '';
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
                        if (addressNameValidationMessage.isNotEmpty)
                          SizedBox(height: 5.5.h),
                        if (addressNameValidationMessage.isNotEmpty)
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/error-icon.svg'),
                              SizedBox(width: 10.w),
                              Text(
                                addressNameValidationMessage,
                                style: TextStyle(
                                  color: const Color(0xFFFF3236),
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 16.h),
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
                                    cubit.emit(CartStatesRefreshState());
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'City',
                                    hintStyle: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
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
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 16.h),
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
                                                  CartStatesRefreshState());
                                            },
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Block',
                                              hintStyle: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
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
                                            fontWeight: FontWeight.w600,
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
                                                  CartStatesRefreshState());
                                            },
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Road',
                                              hintStyle: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
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
                                            fontWeight: FontWeight.w600,
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
                        SizedBox(height: 16.h),
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
                                                  CartStatesRefreshState());
                                            },
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Building',
                                              hintStyle: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
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
                                            fontWeight: FontWeight.w600,
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
                                                  CartStatesRefreshState());
                                            },
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Shop/Office',
                                              hintStyle: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
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
                                            fontWeight: FontWeight.w600,
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
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                                  Image(
                                    image: AssetImage(
                                      'assets/images/$countryFlag',
                                    ),
                                    width: 20.w,
                                    height: 14.h,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 10.w),
                                  SizedBox(
                                    height: 30.h,
                                    child: Text(
                                      countryCode!,
                                      style: TextStyle(
                                        color: const Color(0xFFCACDD5),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        height: 1.6,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                height: 48.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 1.0,
                                    color: activeTextFormField == 'Phone Number'
                                        ? figmaActiveColor
                                        : phoneNumberBorder,
                                  ),
                                  borderRadius: BorderRadius.circular(6.r),
                                  boxShadow:
                                      activeTextFormField == 'Phone Number'
                                          ? borderActiveBoxShadow
                                          : phoneNumberShadowBorder,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: phoneNumberController,
                                        keyboardType: TextInputType.phone,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        maxLines: 1,
                                        obscureText: false,
                                        onChanged: (value) {},
                                        onFieldSubmitted: (value) {},
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            phoneNumberBorder = figmaErrorColor;
                                            phoneNumberShadowBorder =
                                                borderErrorBoxShadow;
                                            phoneNumberValidationMessage =
                                                'Phone Number cant be empty';
                                          }
                                          if (value.isNotEmpty &&
                                              CacheHelper.getData(
                                                      key: 'countryKey') ==
                                                  'Bahrain') {
                                            if (!RegExp(bahrainPhonePattern)
                                                .hasMatch(value)) {
                                              phoneNumberBorder =
                                                  figmaErrorColor;
                                              phoneNumberShadowBorder =
                                                  borderErrorBoxShadow;
                                              phoneNumberValidationMessage =
                                                  'Phone Number should be 8 digits';
                                            } else {
                                              phoneNumberBorder =
                                                  const Color(0xFFE2E4E8);
                                              phoneNumberShadowBorder = [];
                                              phoneNumberValidationMessage = '';
                                            }
                                          } else if (value.isNotEmpty &&
                                              CacheHelper.getData(
                                                      key: 'countryKey') ==
                                                  'Saudi Arabia') {
                                            if (!RegExp(saudiPhonePattern)
                                                .hasMatch(value)) {
                                              phoneNumberBorder =
                                                  figmaErrorColor;
                                              phoneNumberShadowBorder =
                                                  borderErrorBoxShadow;
                                              phoneNumberValidationMessage =
                                                  'Phone Number should be 9 digits without 0';
                                            } else {
                                              phoneNumberBorder =
                                                  const Color(0xFFE2E4E8);
                                              phoneNumberShadowBorder = [];
                                              phoneNumberValidationMessage = '';
                                            }
                                          } else if (value.isNotEmpty &&
                                              CacheHelper.getData(
                                                      key: 'countryKey') ==
                                                  'United Arab Emirates') {
                                            if (!RegExp(emiratesPhonePattern)
                                                .hasMatch(value)) {
                                              phoneNumberBorder =
                                                  figmaErrorColor;
                                              phoneNumberShadowBorder =
                                                  borderErrorBoxShadow;
                                              phoneNumberValidationMessage =
                                                  'Phone Number should be 9 digits without 0';
                                            } else {
                                              phoneNumberBorder =
                                                  const Color(0xFFE2E4E8);
                                              phoneNumberShadowBorder = [];
                                              phoneNumberValidationMessage = '';
                                            }
                                          } else if (value.isEmpty) {
                                            phoneNumberBorder = figmaErrorColor;
                                            phoneNumberShadowBorder =
                                                borderErrorBoxShadow;
                                            phoneNumberValidationMessage =
                                                'Phone Number cant be empty';
                                          }
                                        },
                                        onTap: () {
                                          activeTextFormField = 'Phone Number';
                                          cubit.emit(CartStatesRefreshState());
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Phone Number',
                                          hintStyle: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFFB2B7C2),
                                            fontStyle: FontStyle.normal,
                                            height: 1.6,
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (activeTextFormField == 'Phone Number')
                                      SizedBox(width: 10.w),
                                    if (activeTextFormField == 'Phone Number')
                                      GestureDetector(
                                        onTap: () {
                                          phoneNumberController.text = '';
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
                            ),
                          ],
                        ),
                        if (phoneNumberValidationMessage.isNotEmpty)
                          SizedBox(height: 5.5.h),
                        if (phoneNumberValidationMessage.isNotEmpty)
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/error-icon.svg'),
                              SizedBox(width: 10.w),
                              Text(
                                phoneNumberValidationMessage,
                                style: TextStyle(
                                  color: const Color(0xFFFF3236),
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                DefaultButton(
                  height: 48.h,
                  width: 344.w,
                  label: 'Save Address',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.emit(CartStatesRefreshState());
                    }
                  },
                  labelColor: Colors.white,
                  labelWeight: FontWeight.w600,
                  backGroundColor: figmaPrimaryBlue,
                  labelFontHeight: 1.25,
                  labelFontSize: 18.sp,
                ),
                SizedBox(
                  height: 25.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
