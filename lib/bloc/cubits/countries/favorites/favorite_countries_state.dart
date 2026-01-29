import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../data/models/country_model.dart';

class FavoriteCountriesState extends Equatable {
  final List<CountryData>? favoriteCountries;

  const FavoriteCountriesState({required this.favoriteCountries});

  FavoriteCountriesState copyWith({List<CountryData>? favoriteCountries}) {
    return FavoriteCountriesState(
      favoriteCountries: favoriteCountries ?? this.favoriteCountries,
    );
  }

  @override
  List<Object?> get props => [favoriteCountries];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'favoriteCountries': favoriteCountries?.map((x) => x.toJson()).toList(),
    };
  }

  factory FavoriteCountriesState.fromMap(Map<String, dynamic> map) {
    return FavoriteCountriesState(
     
      favoriteCountries:
          map['favoriteCountries'] != null
              ? (map['favoriteCountries'] as List)
                  .map(
                    (item) =>
                        CountryData.fromJson(item as Map<String, dynamic>),
                  )
                  .toList()
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteCountriesState.fromJson(String source) =>
      FavoriteCountriesState.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
