import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taajer/modules/authentication/authentication_cubit/authentication_states.dart';

class AuthenticationCubit extends Cubit<AuthenticationStates> {
  AuthenticationCubit() : super(AuthenticationStatesInitialState());

  static AuthenticationCubit get(context) => BlocProvider.of(context);
}
