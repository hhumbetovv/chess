import 'package:chess/models/cell_index.dart';
import 'package:chess/types/board_list.dart';
import 'package:uuid/uuid.dart';

abstract class Figure {
  Figure() : id = const Uuid().v4();

  String get icon;
  FigureType get type;

  Figure black();

  final String id;

  List<CellIndex> getTargetCells(CellIndex cell, BoardList board);

  bool inRange(int value) {
    return value >= 0 && value <= 7;
  }
}

enum FigureType {
  white,
  black,
}
