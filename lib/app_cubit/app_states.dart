abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppRefreshState extends AppStates {}

class AppChangeBottomNavBarState extends AppStates {}

class AppGetUserCurrentLatLangLoadingState extends AppStates {}

class AppGetUserCurrentLatLangSuccessState extends AppStates {}

class AppGetUserCurrentLatLangErrorState extends AppStates {
  String error;
  AppGetUserCurrentLatLangErrorState(this.error);
}
