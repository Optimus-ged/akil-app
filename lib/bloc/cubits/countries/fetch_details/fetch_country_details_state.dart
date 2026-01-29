// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:akilapp/bloc/cubits/countries/data/models/country_model.dart';
import 'package:akilapp/utils/app_constants.dart';
import 'package:equatable/equatable.dart';

class FetchCountryDetailsState extends Equatable {
  final AppState? state;
  final String? errorMsg;
  final CountryData? data;

  const FetchCountryDetailsState({
    required this.data,
    required this.state,
    required this.errorMsg,
  });

  FetchCountryDetailsState copyWith({
    CountryData? data,
    AppState? state,
    String? errorMsg,
  }) {
    return FetchCountryDetailsState(
      data: data ?? this.data,
      state: state ?? this.state,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object?> get props => [state, data, errorMsg];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'state': state?.toMap(),
      'errorMsg': errorMsg,
      'data': data?.toJson(),
    };
  }
}
