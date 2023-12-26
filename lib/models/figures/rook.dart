import 'package:chess/models/cell_index.dart';
import 'package:chess/models/figures/figure.dart';
import 'package:chess/models/figures/linear_movement.dart';
import 'package:chess/types/board_list.dart';
import 'package:gen/gen.dart';

final class Rook extends Figure with LinearMovement {
  Rook({
    this.type = FigureType.white,
  });

  @override
  String get icon {
    if (type == FigureType.white) return Assets.icons.icRookWhite.path;
    return Assets.icons.icRookBlack.path;
  }

  @override
  FigureType type;

  @override
  Figure black() {
    return Rook(type: FigureType.black);
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
    return targets;
  }
}
