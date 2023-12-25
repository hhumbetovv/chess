import 'package:chess/models/bishop.dart';
import 'package:chess/models/figure.dart';
import 'package:chess/models/king.dart';
import 'package:chess/models/knight.dart';
import 'package:chess/models/pawn.dart';
import 'package:chess/models/queen.dart';
import 'package:chess/models/rook.dart';
import 'package:chess/ui/board.dart';
import 'package:chess/utility/types.dart';
import 'package:flutter/material.dart';

mixin BoardController on State<Board> {
  FigureType turn = FigureType.black;
  CellIndex? selectedIndex;
  List<CellIndex> targets = [];
  BoardList board = [];

  @override
  void initState() {
    super.initState();
    initializeBoard();
  }

  void initializeBoard() {
    final figures = <Figure>[
      Rook(),
      Knight(),
      Bishop(),
      Queen(),
      King(),
      Bishop(),
      Knight(),
      Rook(),
    ];
    final pawns = List.generate(8, (index) => Pawn());
    board = BoardList.generate(8, (index) {
      if (index == 0) {
        return figures.map((figure) => figure.black()).toList();
      }
      if (index == 1) {
        return pawns.map((pawn) => pawn.black()).toList();
      }
      if (index == 6) return pawns;
      if (index == 7) return figures;
      return List<Figure?>.generate(8, (index) => null).toList();
    }).toList();
  }

  bool checkIsSelected(CellIndex index) {
    final equalVertical = selectedIndex?.ver == index.ver;
    final equalHorizontal = selectedIndex?.hor == index.hor;
    return equalVertical && equalHorizontal;
  }

  void cellOnTap(CellIndex? index) {
    setState(() {
      targets = [];
      selectedIndex = index;
      if (index != null) {
        final figure = board[index.ver][index.hor]!;
        targets = figure.getTargetCells(index, board);
      }
    });
  }
}
