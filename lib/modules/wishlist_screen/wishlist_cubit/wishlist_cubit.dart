import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taajer/modules/wishlist_screen/wishlist_cubit/wishlist_states.dart';

class WishlistCubit extends Cubit<WishlistStates> {
  WishlistCubit() : super(WishlistInitialState());

  static WishlistCubit get(context) => BlocProvider.of(context);
}
