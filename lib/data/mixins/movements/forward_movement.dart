import '../../constants/direction.dart';
import '../../constants/figure_color.dart';
import '../../models/figures/figure.dart';
import '../../types/board_list.dart';
import '../../types/position.dart';

mixin ForwardMovement on Figure {
  Position? checkForward(Position position, BoardList board) {
    final isWhite = color == FigureColor.white;
    final targetPosition = isWhite ? position.up() : position.down();
    if (!inRange(targetPosition)) return null;
    if (!board.getPiece(targetPosition).isEmpty) return null;
    return targetPosition;
  }

  Position? checkCorner(Position position, BoardList board, Direction direction) {
    final isWhite = color == FigureColor.white;
    final targetPosition = (isWhite ? position.up() : position.down()).to(direction);
    if (!inRange(targetPosition)) return null;
    if (board.getPiece(targetPosition).isEmpty) return null;
    if (board.getPiece(targetPosition).color == color) return null;
    return targetPosition;
  }
}
