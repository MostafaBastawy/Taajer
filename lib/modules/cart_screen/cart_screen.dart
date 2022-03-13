import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taajer/modules/cart_screen/cart_cubit/cart_cubit.dart';
import 'package:taajer/modules/cart_screen/cart_cubit/cart_states.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartCubit cubit = CartCubit.get(context);
    return BlocBuilder<CartCubit, CartStates>(
      builder: (BuildContext context, state) => Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
