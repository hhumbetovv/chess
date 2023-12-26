import 'package:chess/constants/cell_action.dart';
import 'package:chess/models/cell_index.dart';
import 'package:chess/models/figures/index.dart';
import 'package:chess/types/board_list.dart';
import 'package:chess/ui/board.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

mixin BoardController on State<Board> {
  FigureType turn = FigureType.white;
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

  void cellOnTap(CellIndex? index, CellAction action) {
    if (action == CellAction.unselect) unselect();
    if (action == CellAction.select) select(index!);
    if (action == CellAction.move) move(index!);
  }

  void unselect() {
    setState(() {
      targets = [];
      selectedIndex = null;
    });
  }

  void select(CellIndex index) {
    setState(() {
      targets = [];
      selectedIndex = index;
      final figure = board.getFigure(index);
      targets = figure!.getTargetCells(index, board);
    });
  }

  void move(CellIndex index) {
    setState(() {
      board = board.moveFigure(index, selectedIndex!);
      unselect();
      changeTurn();
    });
    checkPawnPosition(index);
  }

  void checkPawnPosition(CellIndex index) {
    final figure = board.getFigure(index);
    final edge = figure?.type == FigureType.black ? 7 : 0;
    if (figure is Pawn && index.ver == edge) {
      //TODO: Implement Figure selection
      showDialog(
        context: context,
        builder: (context) {
          return const SimpleDialog(
            title: Text('Select a Figure'),
            children: [],
          );
        },
      );
      if (kDebugMode) {
        print('Select an Figure');
      }
    }
  }

  void changeTurn() {
    if (turn == FigureType.white) {
      turn = FigureType.black;
    } else {
      turn = FigureType.white;
    }
  }
}
