import 'package:chess/data/constants/direction.dart';
import 'package:chess/data/constants/figure_color.dart';
import 'package:chess/data/mixins/movements/forward_movement.dart';
import 'package:chess/data/models/figures/figure.dart';
import 'package:chess/data/types/board_list.dart';
import 'package:chess/data/types/position.dart';
import 'package:gen/gen.dart';

final class Pawn extends Figure with ForwardMovement {
  Pawn({
    required this.color,
  });

  @override
  final FigureColor color;

  @override
  SvgGenImage get getIcon {
    if (color == FigureColor.white) return Assets.icons.icPawnWhite;
    return Assets.icons.icPawnBlack;
  }

  @override
  List<Position> getTargets(Position position, BoardList board) {
    final targets = <Position>[];
    final oneForward = checkForward(position, board);
    final isFirstMove = color == FigureColor.white ? (position.y == 6) : (position.y == 1);
    //! Check Left Corner
    final leftCorner = checkCorner(position, board, Direction.left);
    if (leftCorner != null) targets.add(leftCorner);
    //! Check Right Corner
    final rightCorner = checkCorner(position, board, Direction.right);
    if (rightCorner != null) targets.add(rightCorner);
    //! Check One Step Forward
    if (oneForward == null) return targets;
    targets.add(oneForward);
    //! Check Two Step Forward
    if (!isFirstMove) return targets;
    final twoForward = checkForward(oneForward, board);
    if (twoForward != null) targets.add(twoForward);
    return targets;
  }

  @override
  List<Object?> get props => [color, getIcon, id];
}
