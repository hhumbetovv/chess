import 'package:chess/data/constants/direction.dart';
import 'package:chess/data/constants/figure_color.dart';
import 'package:chess/data/mixins/movements/directional_movement.dart';
import 'package:chess/data/models/figures/figure.dart';
import 'package:chess/data/types/board_list.dart';
import 'package:chess/data/types/position.dart';
import 'package:gen/gen.dart';

final class Rook extends Figure with DirectionalMovement {
  Rook({
    required this.color,
  });

  @override
  final FigureColor color;

  @override
  SvgGenImage get getIcon {
    if (color == FigureColor.white) return Assets.icons.icRookWhite;
    return Assets.icons.icRookBlack;
  }

  @override
  List<Position> getTargets(Position position, BoardList board) {
    final targets = <Position>[];
    //! Check Top
    getDirectionalTargets(position, board, Direction.up).forEach(targets.add);
    //! Check Right
    getDirectionalTargets(position, board, Direction.right).forEach(targets.add);
    //! Check Bottom
    getDirectionalTargets(position, board, Direction.down).forEach(targets.add);
    //! Check Left
    getDirectionalTargets(position, board, Direction.left).forEach(targets.add);
    return targets;
  }

  @override
  List<Object?> get props => [color, getIcon, id];
}
