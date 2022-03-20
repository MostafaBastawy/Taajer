import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taajer/modules/policies/policies_cubit/policies_states.dart';

class PoliciesCubit extends Cubit<PoliciesStates> {
  PoliciesCubit() : super(PoliciesInitialState());

  static PoliciesCubit get(context) => BlocProvider.of(context);
}
