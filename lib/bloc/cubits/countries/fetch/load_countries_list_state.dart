import 'package:akilapp/bloc/cubits/countries/data/models/country_model.dart';
import 'package:akilapp/utils/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';

class LoadCountriesState extends Equatable {
  final AppState? state;
  final String? errorMsg;
  final List<CountryData>? data;
  final List<CountryData>? allCountries;

  const LoadCountriesState({
    required this.data,
    required this.allCountries,
    required this.state,
    required this.errorMsg,
  });

  LoadCountriesState copyWith({
    List<CountryData>? data,
    List<CountryData>? allCountries,
    AppState? state,
    String? errorMsg,
  }) {
    return LoadCountriesState(
      data: data ?? this.data,
      allCountries: allCountries ?? this.allCountries,
      state: state ?? this.state,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object?> get props => [state, data, allCountries, errorMsg];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'state': state?.toMap(),
      'errorMsg': errorMsg,
      'data': data?.map((x) => x.toJson()).toList(),
      'allCountries': allCountries?.map((x) => x.toJson()).toList(),
    };
  }

  factory LoadCountriesState.fromMap(Map<String, dynamic> map) {
    return LoadCountriesState(
      state:
          map['state'] != null ? AppStateExtension.fromMap(map['state']) : null,
      errorMsg: map['errorMsg'] != null ? map['errorMsg'] as String : null,
      allCountries:
          map['allCountries'] != null
              ? (map['allCountries'] as List)
                  .map(
                    (item) =>
                        CountryData.fromJson(item as Map<String, dynamic>),
                  )
                  .toList()
              : null,
      data:
          map['data'] != null
              ? (map['data'] as List)
                  .map(
                    (item) =>
                        CountryData.fromJson(item as Map<String, dynamic>),
                  )
                  .toList()
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoadCountriesState.fromJson(String source) =>
      LoadCountriesState.fromMap(json.decode(source) as Map<String, dynamic>);
}
