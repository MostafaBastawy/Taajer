import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taajer/app_cubit/app_cubit.dart';
import 'package:taajer/app_cubit/bloc_observer.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_cubit.dart';
import 'package:taajer/modules/authentication/register/language_country_selection.dart';
import 'package:taajer/modules/browse_screen/browse_cubit/browse_cubit.dart';
import 'package:taajer/modules/home_layout.dart';
import 'package:taajer/modules/orders_screen/orders_cubit/orders_cubit.dart';
import 'package:taajer/shared/components/tools/shared_preference/keys.dart';
import 'package:taajer/shared/components/tools/shared_preference/shared_preference.dart';
import 'package:taajer/shared/styles/themes.dart';
import 'package:taajer/translations/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  await [
    Permission.location,
    Permission.locationAlways,
    Permission.locationWhenInUse,
    Permission.notification,
  ].request();
  BlocOverrides.runZoned(
    () {
      runApp(
        EasyLocalization(
          startLocale: const Locale('en'),
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          path:
              'assets/translations', // <-- change the path of the translation files
          fallbackLocale: const Locale('en'),
          assetLoader: const CodegenLoader(),

          child: const MyApp(),
        ),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()..getUserCurrentLatLang(),
        ),
        BlocProvider(
          create: (BuildContext context) => AuthenticationCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => BrowseCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => OrdersCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => MaterialApp(
          builder: (context, widget) {
            ScreenUtil.setContext(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          theme: lightTheme(context),
          darkTheme: darkTheme,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          // home: LanguageCountryScreen(),
          home: CacheHelper.getData(key: accessTokenKey) == null
              ? LanguageCountryScreen()
              : const HomeLayout(),
        ),
      ),
    );
  }
}
