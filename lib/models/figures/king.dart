import 'package:chess/models/cell_index.dart';
import 'package:chess/models/figures/figure.dart';
import 'package:chess/types/board_list.dart';
import 'package:gen/gen.dart';

final class King extends Figure {
  King({
    this.type = FigureType.white,
  });

  @override
  String get icon {
    if (type == FigureType.white) return Assets.icons.icKingWhite.path;
    return Assets.icons.icKingBlack.path;
  }

  @override
  FigureType type;

  @override
  Figure black() {
    return King(type: FigureType.black);
  }

  @override
  List<CellIndex> getTargetCells(CellIndex cell, BoardList board) {
    // TODO: implement getTargetCells
    throw UnimplementedError();
  }
}
