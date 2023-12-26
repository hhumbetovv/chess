import 'package:chess/models/cell_index.dart';
import 'package:chess/models/figures/figure.dart';
import 'package:chess/types/board_list.dart';
import 'package:gen/gen.dart';

final class Knight extends Figure {
  Knight({
    this.type = FigureType.white,
  });

  @override
  String get icon {
    if (type == FigureType.white) return Assets.icons.icKnightWhite.path;
    return Assets.icons.icKnightBlack.path;
  }

  @override
  FigureType type;

  @override
  Figure black() {
    return Knight(type: FigureType.black);
  }

  @override
  List<CellIndex> getTargetCells(CellIndex cell, BoardList board) {
    final possibleTargets = <CellIndex>[
      CellIndex(ver: cell.ver - 2, hor: cell.hor + 1),
      CellIndex(ver: cell.ver - 2, hor: cell.hor - 1),
      CellIndex(ver: cell.ver + 2, hor: cell.hor + 1),
      CellIndex(ver: cell.ver + 2, hor: cell.hor - 1),
      CellIndex(ver: cell.ver + 1, hor: cell.hor - 2),
      CellIndex(ver: cell.ver - 1, hor: cell.hor - 2),
      CellIndex(ver: cell.ver + 1, hor: cell.hor + 2),
      CellIndex(ver: cell.ver - 1, hor: cell.hor + 2),
    ];
    bool checkCell(CellIndex index) {
      if (!inRange(index.hor)) return false;
      if (!inRange(index.ver)) return false;
      final figure = board.getFigure(index);
      if (figure != null && figure.type == type) return false;
      return true;
    }

    final targets = <CellIndex>[];

    for (final target in possibleTargets) {
      if (checkCell(target)) targets.add(target);
    }

    return targets;
  }
}
