import '../models/piece.dart';
import 'position.dart';

typedef BoardList = List<List<Piece>>;

extension BoardListExtension on BoardList {
  Piece getPiece(Position position) {
    return this[position.y][position.x];
  }

  void setPiece(Piece piece) {
    final position = piece.position;
    this[position.y][position.x] = piece;
  }

  void setPieces(List<Piece> pieces) {
    for (final piece in pieces) {
      setPiece(piece);
    }
  }
}
