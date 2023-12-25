import 'package:chess/models/figure.dart';
import 'package:chess/utility/types.dart';
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
  List<CellIndex> getTargetCells(CellIndex cell, List<List<Figure?>> board) {
    // TODO: implement getTargetCells
    throw UnimplementedError();
  }
}
