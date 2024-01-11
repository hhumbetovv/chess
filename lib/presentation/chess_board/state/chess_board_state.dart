part of 'chess_board_cubit.dart';

class ChessBoardState extends Equatable {
  const ChessBoardState({
    required this.board,
    required this.turnColor,
    required this.targets,
    this.selectedPiece,
    this.lastMovedPiece,
  });

  final BoardList board;
  final FigureColor turnColor;
  final List<Piece> targets;
  final Piece? selectedPiece;
  final Piece? lastMovedPiece;

  @override
  List<Object?> get props => [board, selectedPiece, targets, turnColor, lastMovedPiece];

  ChessBoardState copyWith({
    BoardList? board,
    FigureColor? turnColor,
    List<Piece>? targets,
    ValueGetter<Piece?>? selectedPiece,
    ValueGetter<Piece?>? lastMovedPiece,
  }) {
    return ChessBoardState(
      board: board ?? this.board,
      turnColor: turnColor ?? this.turnColor,
      targets: targets ?? this.targets,
      selectedPiece: selectedPiece != null ? selectedPiece() : this.selectedPiece,
      lastMovedPiece: lastMovedPiece != null ? lastMovedPiece() : this.lastMovedPiece,
    );
  }
}
