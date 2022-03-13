import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taajer/modules/cart_screen/cart_cubit/cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());

  static CartCubit get(context) => BlocProvider.of(context);
}
