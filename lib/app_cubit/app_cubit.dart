import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:taajer/app_cubit/app_states.dart';
import 'package:taajer/modules/home_screen/home_screen.dart';
import 'package:taajer/modules/orders_screen/orders_screen.dart';
import 'package:taajer/modules/profile_screen/profile_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
    OrdersScreen(),
    const HomeScreen(),
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
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled!) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      currentUserLatLng = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      getUserFormattedAddress();
      emit(AppGetUserCurrentLatLangSuccessState());
    }
  }

  List<Placemark> userFormattedAddress = [];
  void getUserFormattedAddress() async {
    userFormattedAddress = await placemarkFromCoordinates(
        currentUserLatLng!.latitude, currentUserLatLng!.longitude);
  }
}
