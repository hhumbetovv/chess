import 'package:chess/utility/types.dart';

abstract class Figure {
  String get icon;
  FigureType get type;

  Figure black();

  List<CellIndex> getTargetCells(CellIndex cell, List<List<Figure?>> board);
}

enum FigureType {
  white,
  black,
}
