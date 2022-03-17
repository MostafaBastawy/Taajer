import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taajer/modules/cart_screen/cart_cubit/cart_cubit.dart';
import 'package:taajer/modules/cart_screen/cart_cubit/cart_states.dart';
import 'package:taajer/modules/cart_screen/select_address.dart';
import 'package:taajer/shared/components/cart_screen/choose_delivery_day_bottom_sheet.dart';
import 'package:taajer/shared/components/cart_screen/delivery_builder_item.dart';
import 'package:taajer/shared/components/cart_screen/paymen_method_bottom_sheet.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/styles/colors.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartCubit cubit = CartCubit.get(context);
    return BlocBuilder<CartCubit, CartStates>(
      builder: (BuildContext context, state) => Scaffold(
        appBar: AppBar(
          title: const Text('Checkout'),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery Address',
                        style: TextStyle(
                          color: figmaOurBlack,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        width: 343.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(
                              color: const Color(0xFFE2E4E8), width: 1.0),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 343.w,
                              height: 121.h,
                              child: GoogleMap(
                                mapType: MapType.normal,
                                myLocationButtonEnabled: true,
                                zoomControlsEnabled: false,
                                zoomGesturesEnabled: true,
                                myLocationEnabled: false,
                                onMapCreated:
                                    (GoogleMapController controller) {},
                                initialCameraPosition: const CameraPosition(
                                  target: LatLng(
                                      30.04581406602633, 31.235976228319483),
                                  zoom: 14.47460,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 343.w,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 18.w, vertical: 15.h),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/cart_screen/location-pin-icon.svg',
                                      width: 28.w,
                                      height: 28.h,
                                    ),
                                    SizedBox(width: 19.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Starbucks (Adliya)',
                                          style: TextStyle(
                                            color: const Color(0xFF494A53),
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        SizedBox(
                                          width: 114.w,
                                          height: 26.h,
                                          child: Text(
                                            'Shop 33, Building 1066 Road 1215, Block 112',
                                            style: TextStyle(
                                              color: const Color(0xFFB2B7C2),
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10.sp,
                                              height: 1.25,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        navigateTo(
                                          widget: SelectAddress(),
                                          context: context,
                                        );
                                      },
                                      child: Text(
                                        'Change',
                                        style: TextStyle(
                                          color: figmaPrimaryBlue,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) =>
                            GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white.withOpacity(0.0),
                                builder: (BuildContext context) =>
                                    const ChooseDeliveryDayBottomSheet());
                          },
                          child: const DeliveryBuilderItem(),
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 28.h),
                        itemCount: 3,
                      ),
                      SizedBox(height: 95.h),
                      Text(
                        'Payment Method',
                        style: TextStyle(
                          color: figmaOurBlack,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.white.withOpacity(0.0),
                              builder: (BuildContext context) =>
                                  const PaymentMethodBottomSheet());
                        },
                        child: Container(
                          width: 343.w,
                          height: 48.h,
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                                color: const Color(0xFFE2E4E8), width: 1.0),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/cart_screen/payment-debit-icon.svg',
                                width: 19.53.w,
                                height: 28.h,
                              ),
                              SizedBox(width: 23.47.w),
                              Text(
                                'Benefit',
                                style: TextStyle(
                                  color: const Color(0xFF494A53),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'Change',
                                style: TextStyle(
                                  color: figmaPrimaryBlue,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 37.h),
                      Text(
                        'Order Summary',
                        style: TextStyle(
                          color: figmaOurBlack,
                          fontStyle: FontStyle.normal,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 17.35.h),
                      Row(
                        children: [
                          Text(
                            'Items',
                            style: TextStyle(
                              color: figmaOurBlack,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'BHD 22.000',
                            style: TextStyle(
                              color: figmaOurBlack,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.47.h),
                      Row(
                        children: [
                          Text(
                            'VAT (10%)',
                            style: TextStyle(
                              color: figmaOurBlack,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'BHD 2.200',
                            style: TextStyle(
                              color: figmaOurBlack,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.47.h),
                      Row(
                        children: [
                          Text(
                            'Delivery',
                            style: TextStyle(
                              color: figmaOurBlack,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'BHD 3.000',
                            style: TextStyle(
                              color: figmaOurBlack,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.47.h),
                      Row(
                        children: [
                          Text(
                            'Discount',
                            style: TextStyle(
                              color: figmaOurBlack,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '- BHD 5.000',
                            style: TextStyle(
                              color: const Color(0xFF028177),
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 13.88.h),
                      Row(
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              color: figmaOurBlack,
                              fontStyle: FontStyle.normal,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'BHD 22.200',
                            style: TextStyle(
                              color: figmaOurBlack,
                              fontStyle: FontStyle.normal,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 23.59.h),
                    ],
                  ),
                ),
              ),
              DefaultButton(
                height: 48.h,
                width: 344.w,
                label: 'Place Order',
                onPressed: () {},
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
