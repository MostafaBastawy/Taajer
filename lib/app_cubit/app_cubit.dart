import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:taajer/app_cubit/app_states.dart';
import 'package:taajer/modules/browse_screen/browse_screen.dart';
import 'package:taajer/modules/cart_screen/cart_screen.dart';
import 'package:taajer/modules/orders_screen/orders_screen.dart';
import 'package:taajer/modules/profile_screen/profile_screen.dart';
import 'package:taajer/modules/wishlist_screen/wishlist_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [
    const BrowseScreen(),
    WishlistScreen(),
    OrdersScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;

    emit(AppChangeBottomNavBarState());
  }

  Position? currentUserLatLng;
  bool? serviceEnabled;
  LocationPermission? permission;
  void getUserCurrentLatLang() async {
    emit(AppGetUserCurrentLatLangLoadingState());
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    currentUserLatLng = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    getUserFormattedAddress();

    emit(AppGetUserCurrentLatLangSuccessState());
  }

  List<Placemark> userFormattedAddress = [];
  void getUserFormattedAddress() async {
    userFormattedAddress = await placemarkFromCoordinates(
        currentUserLatLng!.latitude, currentUserLatLng!.longitude);
  }
}
