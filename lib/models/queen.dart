import 'package:chess/models/figure.dart';
import 'package:chess/utility/types.dart';
import 'package:gen/gen.dart';

final class Queen extends Figure {
  Queen({
    this.type = FigureType.white,
  });

  @override
  String get icon {
    if (type == FigureType.white) return Assets.icons.icQueenWhite.path;
    return Assets.icons.icQueenBlack.path;
  }

  @override
  FigureType type;

  @override
  Figure black() {
    return Queen(type: FigureType.black);
  }

  @override
  List<CellIndex> getTargetCells(CellIndex cell, List<List<Figure?>> board) {
    // TODO: implement getTargetCells
    throw UnimplementedError();
  }
}
