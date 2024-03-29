import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gen/gen.dart';

import '../constants/figure_color.dart';
import '../types/board_list.dart';
import '../types/position.dart';
import 'figures/figure.dart';
import 'figures/pawn.dart';

final class Piece extends Equatable {
  const Piece({
    required this.position,
    this.isSelected = false,
    this.isTarget = false,
    Figure? figure,
  }) : _figure = figure;

  final Figure? _figure;
  final Position position;
  final bool isSelected;
  final bool isTarget;

  SvgGenImage? get icon => _figure?.getIcon;
  FigureColor? get color => _figure?.color;
  String? get tag => _figure?.id;
  bool get isEmpty => _figure == null;
  bool get isPawn => _figure is Pawn;

  @override
  List<Object?> get props => [_figure, position, isSelected, isTarget];

  List<Position> getTargets(BoardList board) {
    return _figure?.getTargets(position, board) ?? [];
  }

  Piece copyWith({
    ValueGetter<Figure?>? figure,
    Position? position,
    bool? isSelected,
    bool? isTarget,
  }) {
    return Piece(
      figure: figure != null ? figure() : _figure,
      position: position ?? this.position,
      isSelected: isSelected ?? this.isSelected,
      isTarget: isTarget ?? this.isTarget,
    );
  }
}
