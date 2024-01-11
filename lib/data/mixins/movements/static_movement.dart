import 'package:chess/data/models/figures/figure.dart';
import 'package:chess/data/types/board_list.dart';
import 'package:chess/data/types/position.dart';

mixin StaticMovement on Figure {
  List<Position> getPossibleLegalTargets(List<Position> possibleTargets, BoardList board) {
    bool checkIsLegal(Position position) {
      if (!inRange(position)) return false;
      if (board.getPiece(position).color == color) return false;
      return true;
    }

    return possibleTargets.where(checkIsLegal).toList();
  }
}
