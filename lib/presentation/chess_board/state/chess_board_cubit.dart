import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/figure_color.dart';
import '../../../data/models/piece.dart';
import '../../../data/types/board_list.dart';
import '../../../data/types/position.dart';
import 'mixin/board_generator.dart';

part 'chess_board_state.dart';

class ChessBoardCubit extends Cubit<ChessBoardState> with BoardGenerate {
  ChessBoardCubit()
      : super(
          const ChessBoardState(
            board: [],
            targets: [],
            turnColor: FigureColor.white,
          ),
        );

  void initBoard() {
    emit(
      state.copyWith(
        board: List.generate(8, growable: false, (y) {
          if (y == 0) return getBlackPieces();
          if (y == 1) return getBlackPawns();
          if (y == 6) return getWhitePawns();
          if (y == 7) return getWhitePieces();
          return emptyList(y);
        }),
      ),
    );
  }

  void resetBoard() {
    final board = List.generate(8, growable: false, (y) {
      if (y == 0) return getBlackPieces();
      if (y == 1) return getBlackPawns();
      if (y == 6) return getWhitePawns();
      if (y == 7) return getWhitePieces();
      return emptyList(y);
    });
    emit(
      ChessBoardState(
        board: board,
        turnColor: FigureColor.white,
        targets: const [],
      ),
    );
  }

  void onCellTap(Piece piece) {
    if (piece.color == state.turnColor) {
      piece.isSelected ? unselect() : select(piece);
    } else if (piece.isTarget) {
      move(piece);
    } else {
      unselect();
    }
  }

  void move(Piece targetPiece) {
    final board = state.board;
    final emptyPiece = Piece(
      position: state.selectedPiece!.position,
    );
    final selectedPiece = state.selectedPiece!.copyWith(
      position: targetPiece.position,
      isSelected: false,
    );
    board.setPieces([emptyPiece, selectedPiece]);
    emit(
      state.copyWith(
        board: board,
        selectedPiece: () => null,
        lastMovedPiece: () => selectedPiece,
      ),
    );
    removeTarget(targetPiece);
    removeTargets();
    changeTurnColor();
  }

  void updatePiece(Piece piece) {
    final board = state.board;
    final lastMovedPiece = piece;
    board.setPiece(piece);
    emit(state.copyWith(board: board, lastMovedPiece: () => lastMovedPiece));
  }

  void select(Piece piece) {
    unselect();
    final board = state.board;
    final selectedPiece = piece.copyWith(isSelected: true);
    board.setPiece(selectedPiece);
    setTargets(selectedPiece.getTargets(state.board));
    emit(
      state.copyWith(
        board: board,
        selectedPiece: () => selectedPiece,
      ),
    );
  }

  void unselect() {
    if (state.selectedPiece != null) {
      final board = state.board;
      final selectedPiece = state.selectedPiece!.copyWith(isSelected: false);
      board.setPiece(selectedPiece);
      emit(
        state.copyWith(
          board: board,
          selectedPiece: () => null,
        ),
      );
    }
    removeTargets();
  }

  void setTargets(List<Position> targetPositions) {
    final board = state.board;
    final targets = <Piece>[];
    for (final targetPosition in targetPositions) {
      final targetPiece = board.getPiece(targetPosition).copyWith(isTarget: true);
      board.setPiece(targetPiece);
      targets.add(targetPiece);
    }
    emit(state.copyWith(board: board, targets: targets));
  }

  void removeTargets() {
    final board = state.board;
    for (final targetPiece in state.targets) {
      board.setPiece(targetPiece.copyWith(isTarget: false));
    }
    emit(state.copyWith(board: board, targets: []));
  }

  void removeTarget(Piece targetPiece) {
    final targets = state.targets;
    if (targets.contains(targetPiece)) {
      targets.remove(targetPiece);
    }
    emit(state.copyWith(targets: targets));
  }

  void changeTurnColor() {
    if (state.turnColor == FigureColor.white) {
      emit(state.copyWith(turnColor: FigureColor.black));
    } else {
      emit(state.copyWith(turnColor: FigureColor.white));
    }
  }
}
