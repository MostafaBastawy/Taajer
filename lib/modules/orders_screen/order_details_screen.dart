import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taajer/modules/orders_screen/orders_cubit/orders_cubit.dart';
import 'package:taajer/modules/orders_screen/orders_cubit/orders_states.dart';
import 'package:taajer/shared/components/orders_screen/order_details_short_details_builder.dart';
import 'package:taajer/shared/components/orders_screen/order_details_supplier_builder_item.dart';
import 'package:taajer/shared/styles/colors.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersCubit cubit = OrdersCubit.get(context);
    return BlocBuilder<OrdersCubit, OrdersStates>(
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
          title: const Text('Order Details'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Align(
              alignment: AlignmentDirectional.topCenter,
              child: Column(
                children: [
                  SizedBox(height: 31.h),
                  Text(
                    'Order ID #8E7D33-323555',
                    style: TextStyle(
                      color: figmaOurBlack,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        OrderShortDetailsBuilderItem(
                          icon:
                              'assets/images/orders_screen/order-date-icon.svg',
                          value: '17 Feburary 2022',
                        ),
                        const Spacer(),
                        OrderShortDetailsBuilderItem(
                          icon:
                              'assets/images/orders_screen/order-value-icon.svg',
                          value: 'BHD 27.250',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        OrderShortDetailsBuilderItem(
                          icon:
                              'assets/images/orders_screen/order-time-icon.svg',
                          value: '17:35',
                        ),
                        const Spacer(),
                        OrderShortDetailsBuilderItem(
                          icon:
                              'assets/images/orders_screen/order-payment-icon.svg',
                          value: 'Benefit',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      'Delivery Address',
                      style: TextStyle(
                        color: figmaOurBlack,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 19.h),
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
                            onMapCreated: (GoogleMapController controller) {},
                            initialCameraPosition: const CameraPosition(
                              target:
                                  LatLng(30.04581406602633, 31.235976228319483),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Starbucks (Adliya)',
                                      style: TextStyle(
                                        color: figmaShade1,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    SizedBox(
                                      width: 146.w,
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 19.h),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) =>
                        OrderDetailsSupplierBuilderItem(),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 10.h),
                    itemCount: 4,
                  ),
                  SizedBox(height: 100.h),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      'Order Summary',
                      style: TextStyle(
                        color: figmaOurBlack,
                        fontStyle: FontStyle.normal,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
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
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
