import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taajer/modules/orders_screen/orders_cubit/orders_states.dart';

class OrdersCubit extends Cubit<OrdersStates> {
  OrdersCubit() : super(OrdersInitialState());

  static OrdersCubit get(context) => BlocProvider.of(context);
}
