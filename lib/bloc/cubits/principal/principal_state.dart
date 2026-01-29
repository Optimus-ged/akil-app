import 'package:equatable/equatable.dart';

class PrincipalState extends Equatable {
  final int? principalNavIndex;

  const PrincipalState({required this.principalNavIndex});

  PrincipalState copyWith({int? principalNavIndex}) {
    return PrincipalState(
      principalNavIndex: principalNavIndex ?? this.principalNavIndex,
    );
  }

  @override
  List<Object?> get props => [principalNavIndex];
}
