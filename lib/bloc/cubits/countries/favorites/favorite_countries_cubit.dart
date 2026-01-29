import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../data/models/country_model.dart';
import 'favorite_countries_state.dart';

class FavoriteCountriesCubit extends HydratedCubit<FavoriteCountriesState> {
  FavoriteCountriesCubit()
    : super(const FavoriteCountriesState(favoriteCountries: []));

  addFavorite(CountryData country) {
    final updatedList = List<CountryData>.from(state.favoriteCountries ?? [])
      ..add(country);
    emit(state.copyWith(favoriteCountries: updatedList));
  }

  removeFavorite(CountryData country) {
    final updatedList = List<CountryData>.from(state.favoriteCountries ?? [])
      ..removeWhere((c) => c.cca2 == country.cca2);
    emit(state.copyWith(favoriteCountries: updatedList));
  }

  @override
  FavoriteCountriesState? fromJson(Map<String, dynamic> json) {
    return FavoriteCountriesState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(FavoriteCountriesState state) {
    return state.toMap();
  }
}
