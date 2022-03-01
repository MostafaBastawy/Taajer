import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taajer/app_cubit/app_cubit.dart';
import 'package:taajer/app_cubit/app_states.dart';
import 'package:taajer/shared/components/bottom_nav_bar/bottom_nav_bar.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);

    return BlocBuilder<AppCubit, AppStates>(
      builder: (BuildContext context, state) => Scaffold(
        appBar: null,
        bottomNavigationBar: BottomNavigationBar(
          items: bottomNavBarItem,
          currentIndex: cubit.currentIndex,
          onTap: (int index) {
            cubit.changeBottomNavBar(index);
          },
        ),
        body: cubit.screens[cubit.currentIndex],
      ),
    );
  }
}
