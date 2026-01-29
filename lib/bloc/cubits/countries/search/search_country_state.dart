// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:akilapp/bloc/cubits/countries/data/models/country_model.dart';
import 'package:akilapp/utils/app_constants.dart';
import 'package:equatable/equatable.dart';


class SearchCountryState extends Equatable {
  final AppState? state;
  final String? errorMsg;
  final List<CountryData>? data;

  const SearchCountryState({
    required this.data,
    required this.state,
    required this.errorMsg,
  });

  SearchCountryState copyWith({
    List<CountryData>? data,
    AppState? state,
    String? errorMsg,
  }) {
    return SearchCountryState(
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
      'data': data?.map((x) => x.toJson()).toList(),
    };
  }
}
