import 'package:chess/models/figure.dart';
import 'package:chess/utility/types.dart';
import 'package:gen/gen.dart';

final class Knight extends Figure {
  Knight({
    this.type = FigureType.white,
  });

  @override
  String get icon {
    if (type == FigureType.white) return Assets.icons.icKnightWhite.path;
    return Assets.icons.icKnightBlack.path;
  }

  @override
  FigureType type;

  @override
  Figure black() {
    return Knight(type: FigureType.black);
  }

  @override
  List<CellIndex> getTargetCells(CellIndex cell, List<List<Figure?>> board) {
    // TODO: implement getTargetCells
    throw UnimplementedError();
  }
}
