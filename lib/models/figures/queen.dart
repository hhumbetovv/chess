import 'package:chess/models/cell_index.dart';
import 'package:chess/models/figures/diagonal_movement.dart';
import 'package:chess/models/figures/figure.dart';
import 'package:chess/models/figures/linear_movement.dart';
import 'package:chess/types/board_list.dart';
import 'package:gen/gen.dart';

final class Queen extends Figure with LinearMovement, DiagonalMovement {
  Queen({
    this.type = FigureType.white,
  });

  @override
  String get icon {
    if (type == FigureType.white) return Assets.icons.icQueenWhite.path;
    return Assets.icons.icQueenBlack.path;
  }

  @override
  FigureType type;

  @override
  Figure black() {
    return Queen(type: FigureType.black);
  }

  @override
  List<CellIndex> getTargetCells(CellIndex cell, BoardList board) {
    final targets = <CellIndex>[];
    //! Check Upward
    getVerticalTargets(cell, board, -1).forEach(targets.add);
    //! Check Downward
    getVerticalTargets(cell, board, 1).forEach(targets.add);
    //! Check Left
    getHorizontalTargets(cell, board, -1).forEach(targets.add);
    //! Check Right
    getHorizontalTargets(cell, board, 1).forEach(targets.add);
    //! Check Top Left
    getDiagonalTargets(cell, board, -1, -1).forEach(targets.add);
    //! Check Top Right
    getDiagonalTargets(cell, board, -1, 1).forEach(targets.add);
    //! Check Bottom Left
    getDiagonalTargets(cell, board, 1, -1).forEach(targets.add);
    //! Check Bottom Right
    getDiagonalTargets(cell, board, 1, 1).forEach(targets.add);
    return targets;
  }
}
