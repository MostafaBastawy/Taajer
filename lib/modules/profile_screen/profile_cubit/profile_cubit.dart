import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taajer/modules/profile_screen/profile_cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);
}
