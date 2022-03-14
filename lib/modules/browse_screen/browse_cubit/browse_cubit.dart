import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taajer/modules/browse_screen/browse_cubit/browse_states.dart';

class BrowseCubit extends Cubit<BrowseStates> {
  BrowseCubit() : super(BrowseInitialState());

  static BrowseCubit get(context) => BlocProvider.of(context);
  double? currentIndex;
}
