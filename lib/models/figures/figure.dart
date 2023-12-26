import 'package:chess/models/cell_index.dart';
import 'package:chess/types/board_list.dart';

abstract class Figure {
  String get icon;
  FigureType get type;

  Figure black();

  List<CellIndex> getTargetCells(CellIndex cell, BoardList board);

  bool inRange(int value) {
    return value >= 0 && value <= 7;
  }
}

enum FigureType {
  white,
  black,
}
