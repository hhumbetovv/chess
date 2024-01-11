import 'package:chess/data/constants/direction.dart';
import 'package:chess/data/models/figures/figure.dart';
import 'package:chess/data/types/board_list.dart';
import 'package:chess/data/types/position.dart';

mixin DirectionalMovement on Figure {
  List<Position> getDirectionalTargets(
    Position position,
    BoardList board,
    Direction direction,
  ) {
    final targets = <Position>[];
    var target = position;
    while (inRange(target.to(direction))) {
      target = target.to(direction);
      final piece = board.getPiece(target);

      if (piece.isEmpty) {
        targets.add(target);
        continue;
      } else if (piece.color != color) {
        targets.add(target);
      }
      break;
    }
    return targets;
  }
}
