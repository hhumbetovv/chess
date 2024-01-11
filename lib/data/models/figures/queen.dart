import 'package:gen/gen.dart';

import '../../constants/direction.dart';
import '../../constants/figure_color.dart';
import '../../mixins/movements/directional_movement.dart';
import '../../types/board_list.dart';
import '../../types/position.dart';
import 'figure.dart';

final class Queen extends Figure with DirectionalMovement {
  Queen({
    required this.color,
  });

  @override
  final FigureColor color;

  @override
  SvgGenImage get getIcon {
    if (color == FigureColor.white) return Assets.icons.icQueenWhite;
    return Assets.icons.icQueenBlack;
  }

  @override
  List<Position> getTargets(Position position, BoardList board) {
    final targets = <Position>[];
    //! Check Top Left
    getDirectionalTargets(position, board, Direction.upLeft).forEach(targets.add);
    //! Check Top
    getDirectionalTargets(position, board, Direction.up).forEach(targets.add);
    //! Check Top Right
    getDirectionalTargets(position, board, Direction.upRight).forEach(targets.add);
    //! Check Right
    getDirectionalTargets(position, board, Direction.right).forEach(targets.add);
    //! Check Bottom Right
    getDirectionalTargets(position, board, Direction.downRight).forEach(targets.add);
    //! Check Bottom
    getDirectionalTargets(position, board, Direction.down).forEach(targets.add);
    //! Check Bottom Left
    getDirectionalTargets(position, board, Direction.downLeft).forEach(targets.add);
    //! Check Left
    getDirectionalTargets(position, board, Direction.left).forEach(targets.add);
    return targets;
  }

  @override
  List<Object?> get props => [color, getIcon, id];
}
