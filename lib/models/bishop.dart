import 'package:chess/models/figure.dart';
import 'package:chess/utility/types.dart';
import 'package:gen/gen.dart';

final class Bishop extends Figure {
  Bishop({
    this.type = FigureType.white,
  });

  @override
  String get icon {
    if (type == FigureType.white) return Assets.icons.icBishopWhite.path;
    return Assets.icons.icBishopBlack.path;
  }

  @override
  FigureType type;

  @override
  Figure black() {
    return Bishop(type: FigureType.black);
  }

  @override
  List<CellIndex> getTargetCells(CellIndex cell, List<List<Figure?>> board) {
    // TODO: implement getTargetCells
    throw UnimplementedError();
  }
}
