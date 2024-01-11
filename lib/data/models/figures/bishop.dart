import 'package:gen/gen.dart';

import '../../constants/direction.dart';
import '../../constants/figure_color.dart';
import '../../mixins/movements/directional_movement.dart';
import '../../types/board_list.dart';
import '../../types/position.dart';
import 'figure.dart';

final class Bishop extends Figure with DirectionalMovement {
  Bishop({
    required this.color,
  });

  @override
  final FigureColor color;

  @override
  SvgGenImage get getIcon {
    if (color == FigureColor.white) return Assets.icons.icBishopWhite;
    return Assets.icons.icBishopBlack;
  }

  @override
  List<Position> getTargets(Position position, BoardList board) {
    final targets = <Position>[];
    //! Check Top Left
    getDirectionalTargets(position, board, Direction.upLeft).forEach(targets.add);
    //! Check Top Right
    getDirectionalTargets(position, board, Direction.upRight).forEach(targets.add);
    //! Check Bottom Right
    getDirectionalTargets(position, board, Direction.downRight).forEach(targets.add);
    //! Check Bottom Left
    getDirectionalTargets(position, board, Direction.downLeft).forEach(targets.add);
    return targets;
  }

  @override
  List<Object?> get props => [color, getIcon, id];
}
