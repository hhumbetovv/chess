import '../../../../data/constants/figure_color.dart';
import '../../../../data/models/figures/figure.dart';
import '../../../../data/models/figures/index.dart';
import '../../../../data/models/piece.dart';

mixin BoardGenerate {
  List<Figure> _getFigures(FigureColor color) {
    return [
      Rook(color: color),
      Knight(color: color),
      Bishop(color: color),
      Queen(color: color),
      King(color: color),
      Bishop(color: color),
      Knight(color: color),
      Rook(color: color),
    ];
  }

  List<Piece> getWhitePieces() {
    return List.generate(8, growable: false, (x) {
      return Piece(
        figure: _getFigures(FigureColor.white)[x],
        position: (x: x, y: 7),
      );
    });
  }

  List<Piece> getBlackPieces() {
    return List.generate(8, growable: false, (x) {
      return Piece(
        figure: _getFigures(FigureColor.black)[x],
        position: (x: x, y: 0),
      );
    });
  }

  List<Piece> getWhitePawns() {
    return List.generate(8, growable: false, (x) {
      return Piece(
        figure: Pawn(color: FigureColor.white),
        position: (x: x, y: 6),
      );
    });
  }

  List<Piece> getBlackPawns() {
    return List.generate(8, growable: false, (x) {
      return Piece(
        figure: Pawn(color: FigureColor.black),
        position: (x: x, y: 1),
      );
    });
  }

  List<Piece> emptyList(int y) {
    return List.generate(8, growable: false, (x) {
      return Piece(
        position: (x: x, y: y),
      );
    });
  }
}
