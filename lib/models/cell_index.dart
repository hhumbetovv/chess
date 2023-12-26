import 'package:equatable/equatable.dart';

class CellIndex extends Equatable {
  const CellIndex({
    required this.ver,
    required this.hor,
  });

  final int ver;
  final int hor;

  CellIndex copyWith({
    int? ver,
    int? hor,
  }) {
    return CellIndex(
      ver: ver ?? this.ver,
      hor: hor ?? this.hor,
    );
  }

  @override
  List<Object?> get props => [ver, hor];
}
