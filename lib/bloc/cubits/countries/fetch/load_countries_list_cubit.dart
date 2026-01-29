import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../utils/app_constants.dart';
import '../data/countries_repository.dart';
import '../data/models/country_model.dart';
import 'load_countries_list_state.dart';

class LoadCountriesListCubit extends HydratedCubit<LoadCountriesState> {
  LoadCountriesListCubit()
    : super(
        const LoadCountriesState(
          state: AppState.initial,
          data: [],
          allCountries: [],
          errorMsg: "",
        ),
      );

  void loadCountries() async {
    try {
      emit(state.copyWith(state: AppState.loading));
      final result = await CountriesRepository.fetch();

      emit(
        state.copyWith(
          state: AppState.success,
          data: result,
          allCountries: result,
        ),
      );
    } catch (error, stacktrace) {
      debugPrint('Main.Main ::: ERROR: $error & STACKTRACE: $stacktrace');
      emit(
        state.copyWith(
          state: AppState.error,
          errorMsg: "Une erreur est survenue",
          data: [],
          allCountries: [],
        ),
      );
    }
  }

  pushData(List<CountryData> countries) {
    emit(
      state.copyWith(
        state: AppState.success,
        data: List<CountryData>.from(countries),
      ),
    );
  }

  void resetToAll() {
    emit(state.copyWith(state: AppState.success, data: state.allCountries));
  }

  @override
  LoadCountriesState? fromJson(Map<String, dynamic> json) {
    return LoadCountriesState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(LoadCountriesState state) {
    return state.toMap();
  }
}
