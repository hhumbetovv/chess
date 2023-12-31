import 'package:chess/models/cell_index.dart';
import 'package:chess/models/figures/figure.dart';
import 'package:chess/types/board_list.dart';
import 'package:gen/gen.dart';

final class Pawn extends Figure {
  Pawn({
    this.type = FigureType.white,
  });

  @override
  String get icon {
    if (type == FigureType.white) return Assets.icons.icPawnWhite.path;
    return Assets.icons.icPawnBlack.path;
  }

  @override
  FigureType type;

  @override
  Figure black() {
    return Pawn(type: FigureType.black);
  }

  @override
  List<CellIndex> getTargetCells(
    CellIndex cell,
    BoardList board,
  ) {
    final targets = <CellIndex>[];
    final isWhite = type == FigureType.white;
    final isFirstMove = isWhite ? (cell.ver == 6) : (cell.ver == 1);
    //! Check Forward
    final oneForward = checkOneForward(cell, board);
    if (oneForward != null) {
      targets.add(oneForward);
      if (isFirstMove) {
        final twoForward = checkOneForward(oneForward, board);
        if (twoForward != null) targets.add(twoForward);
      }
    }
    //! Check Left Corner
    final leftCorner = checkCorner(cell, board, -1);
    if (leftCorner != null) targets.add(leftCorner);
    //! Check Right Corner
    final rightCorner = checkCorner(cell, board, 1);
    if (rightCorner != null) targets.add(rightCorner);
    return targets;
  }

  CellIndex? checkOneForward(CellIndex cell, BoardList board) {
    final index = cell.copyWith(
      ver: cell.ver + (type == FigureType.white ? -1 : 1),
    );
    if (!inRange(index.ver)) return null;
    if (board.getFigure(index) != null) return null;
    return index;
  }

  CellIndex? checkCorner(CellIndex cell, BoardList board, int movement) {
    final index = cell.copyWith(
      ver: cell.ver + (type == FigureType.white ? -1 : 1),
      hor: cell.hor + movement,
    );
    if (!inRange(index.ver)) return null;
    if (!inRange(index.hor)) return null;
    if (board.getFigure(index) == null) return null;
    if (board.getFigure(index)!.type == type) return null;
    return index;
  }
}
