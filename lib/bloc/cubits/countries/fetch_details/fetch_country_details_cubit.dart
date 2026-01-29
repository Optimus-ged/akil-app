import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../utils/app_constants.dart';
import '../data/countries_repository.dart';
import 'fetch_country_details_state.dart';

class FetchCountryDetailsCubit extends Cubit<FetchCountryDetailsState> {
  FetchCountryDetailsCubit()
    : super(
        const FetchCountryDetailsState(
          state: AppState.initial,
          data: null,
          errorMsg: "",
        ),
      );

  void fetchCountryDetails(String code) async {
    try {
      emit(state.copyWith(state: AppState.loading));
      final result = await CountriesRepository.searchDetails(code);

      emit(state.copyWith(state: AppState.success, data: result));
    } catch (error, stacktrace) {
      debugPrint('Main.Main ::: ERROR: $error & STACKTRACE: $stacktrace');
      emit(
        state.copyWith(
          state: AppState.error,
          errorMsg: "Une erreur est survenue",
        ),
      );
    }
  }


}
