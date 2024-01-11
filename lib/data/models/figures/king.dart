import 'package:chess/data/constants/figure_color.dart';
import 'package:chess/data/mixins/movements/static_movement.dart';
import 'package:chess/data/models/figures/figure.dart';
import 'package:chess/data/types/board_list.dart';
import 'package:chess/data/types/position.dart';
import 'package:gen/gen.dart';

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
