import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';
import 'package:uuid/uuid.dart';

import '../../constants/figure_color.dart';
import '../../types/board_list.dart';
import '../../types/position.dart';

abstract class Figure extends Equatable {
  Figure() : id = const Uuid().v4();

  final String id;
  FigureColor get color;
  SvgGenImage get getIcon;
  List<Position> getTargets(Position position, BoardList board);

  bool inRange(Position position) {
    if (position.x < 0 || position.x > 7) return false;
    if (position.y < 0 || position.y > 7) return false;
    return true;
  }

  @override
  List<Object?> get props => [color, getIcon, id];
}
