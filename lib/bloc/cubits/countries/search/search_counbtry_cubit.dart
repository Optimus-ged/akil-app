import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../utils/app_constants.dart';
import '../data/countries_repository.dart';
import 'search_country_state.dart';

class SearchCountryCubit extends Cubit<SearchCountryState> {
  SearchCountryCubit()
    : super(
        const SearchCountryState(
          state: AppState.initial,
          data: [],
          errorMsg: "",
        ),
      );

  void searchCountry(String term) async {
    try {
      emit(state.copyWith(state: AppState.loading));
      final result = await CountriesRepository.searchCountry(term);
      print("eden ====> $result");

      emit(state.copyWith(state: AppState.success, data: result));
    } catch (error, stacktrace) {
      emit(
        state.copyWith(
          state: AppState.error,
          errorMsg: "Une erreur est survenue",
          data: [],
        ),
      );
      print("eden ====> errror");
      debugPrint('Main.Main ::: ERROR: $error & STACKTRACE: $stacktrace');
    }
  }
}
