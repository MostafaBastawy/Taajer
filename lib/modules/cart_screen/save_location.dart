import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taajer/modules/cart_screen/cart_cubit/cart_cubit.dart';
import 'package:taajer/modules/cart_screen/cart_cubit/cart_states.dart';

class SaveLocation extends StatelessWidget {
  const SaveLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartCubit cubit = CartCubit.get(context);
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
      ),
    );
  }
}
