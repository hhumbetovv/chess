import 'package:chess/models/cell_index.dart';
import 'package:chess/models/figures/figure.dart';
import 'package:chess/types/board_list.dart';

mixin LinearMovement on Figure {
  List<CellIndex> getVerticalTargets(
    CellIndex cell,
    BoardList board,
    int movement,
  ) {
    final targets = <CellIndex>[];
    var target = cell;

    while (inRange(target.ver + movement)) {
      target = target.copyWith(ver: target.ver + movement);
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

  List<CellIndex> getHorizontalTargets(
    CellIndex cell,
    BoardList board,
    int movement,
  ) {
    final targets = <CellIndex>[];
    var target = cell;

    while (inRange(target.hor + movement)) {
      target = target.copyWith(hor: target.hor + movement);
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
