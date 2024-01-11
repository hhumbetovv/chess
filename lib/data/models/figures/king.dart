import 'package:gen/gen.dart';

import '../../constants/figure_color.dart';
import '../../mixins/movements/static_movement.dart';
import '../../types/board_list.dart';
import '../../types/position.dart';
import 'figure.dart';

final class King extends Figure with StaticMovement {
  King({
    required this.color,
  });

  @override
  final FigureColor color;

  @override
  SvgGenImage get getIcon {
    if (color == FigureColor.white) return Assets.icons.icKingWhite;
    return Assets.icons.icKingBlack;
  }

  @override
  List<Position> getTargets(Position position, BoardList board) {
    final possibleTargets = <Position>[
      position.up().left(),
      position.up(),
      position.right().up(),
      position.right(),
      position.down().right(),
      position.down(),
      position.left().down(),
      position.left(),
    ];

    return getPossibleLegalTargets(possibleTargets, board);
  }

  @override
  List<Object?> get props => [color, getIcon, id];
}
