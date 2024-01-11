import 'package:chess/data/constants/direction.dart';
import 'package:chess/data/constants/figure_color.dart';
import 'package:chess/data/models/figures/figure.dart';
import 'package:chess/data/types/board_list.dart';
import 'package:chess/data/types/position.dart';

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
