import 'principal_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrincipalCubit extends Cubit<PrincipalState> {
  PrincipalCubit() : super(const PrincipalState(principalNavIndex: 0));

  set setPrincipalNavIndex(int val) =>
      emit(state.copyWith(principalNavIndex: val));
}
