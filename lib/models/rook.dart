import 'package:chess/models/figure.dart';
import 'package:chess/utility/types.dart';
import 'package:gen/gen.dart';

final class Rook extends Figure {
  Rook({
    this.type = FigureType.white,
  });

  @override
  String get icon {
    if (type == FigureType.white) return Assets.icons.icRookWhite.path;
    return Assets.icons.icRookBlack.path;
  }

  @override
  FigureType type;

  @override
  Figure black() {
    return Rook(type: FigureType.black);
  }

  @override
  List<CellIndex> getTargetCells(CellIndex cell, List<List<Figure?>> board) {
    // TODO: implement getTargetCells
    throw UnimplementedError();
  }
}
