import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taajer/app_cubit/app_cubit.dart';
import 'package:taajer/modules/cart_screen/cart_cubit/cart_cubit.dart';
import 'package:taajer/modules/cart_screen/cart_cubit/cart_states.dart';
import 'package:taajer/modules/cart_screen/save_location.dart';
import 'package:taajer/shared/components/tools/default_button.dart';
import 'package:taajer/shared/components/tools/navigator.dart';
import 'package:taajer/shared/styles/colors.dart';

class DeliveryLocation extends StatelessWidget {
  var searchLocationController = TextEditingController();

  DeliveryLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartCubit cubit = CartCubit.get(context);
    return BlocConsumer<CartCubit, CartStates>(
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
          title: const Text('Delivery Location'),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
              child: Container(
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
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFB2B7C2),
                            fontStyle: FontStyle.normal,
                            height: 1.6,
                          ),
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/images/search-icon.svg',
                      width: 15.w,
                      height: 15.h,
                      color: const Color(0xFF525C76),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: true,
                    myLocationEnabled: true,
                    onMapCreated: (GoogleMapController controller) {},
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        AppCubit.get(context).currentUserLatLng!.latitude,
                        AppCubit.get(context).currentUserLatLng!.longitude,
                      ),
                      zoom: 14.47460,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
                    child: DefaultButton(
                      height: 48.h,
                      width: 344.w,
                      label: 'Confirm',
                      onPressed: () {
                        navigateTo(
                          widget: SaveLocation(),
                          context: context,
                        );
                      },
                      labelColor: Colors.white,
                      labelWeight: FontWeight.w600,
                      backGroundColor: figmaPrimaryBlue,
                      labelFontHeight: 1.25,
                      labelFontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
