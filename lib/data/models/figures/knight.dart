import 'package:gen/gen.dart';

import '../../constants/figure_color.dart';
import '../../mixins/movements/static_movement.dart';
import '../../types/board_list.dart';
import '../../types/position.dart';
import 'figure.dart';

class Knight extends Figure with StaticMovement {
  Knight({
    required this.color,
  });

  @override
  final FigureColor color;

  @override
  SvgGenImage get getIcon {
    if (color == FigureColor.white) return Assets.icons.icKnightWhite;
    return Assets.icons.icKnightBlack;
  }

  @override
  List<Position> getTargets(Position position, BoardList board) {
    final possibleTargets = <Position>[
      position.up().up().right(),
      position.up().up().left(),
      position.right().right().up(),
      position.right().right().down(),
      position.down().down().right(),
      position.down().down().left(),
      position.left().left().down(),
      position.left().left().up(),
    ];

    return getPossibleLegalTargets(possibleTargets, board);
  }

  @override
  List<Object?> get props => [color, getIcon, id];
}
