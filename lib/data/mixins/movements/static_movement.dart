import '../../models/figures/figure.dart';
import '../../types/board_list.dart';
import '../../types/position.dart';

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
