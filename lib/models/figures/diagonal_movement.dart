import 'package:chess/models/cell_index.dart';
import 'package:chess/models/figures/figure.dart';
import 'package:chess/types/board_list.dart';

mixin DiagonalMovement on Figure {
  List<CellIndex> getDiagonalTargets(
    CellIndex cell,
    BoardList board,
    int ver,
    int hor,
  ) {
    final targets = <CellIndex>[];
    var target = cell;

    while (inRange(target.ver + ver) && inRange(target.hor + hor)) {
      target = CellIndex(ver: target.ver + ver, hor: target.hor + hor);
      final figure = board.getFigure(target);

      if (figure == null) {
        targets.add(target);
      } else if (figure.type != type) {
        targets.add(target);
        break;
      } else {
        break;
      }
    }
    return targets;
  }
}
