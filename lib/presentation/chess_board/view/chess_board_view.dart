import 'package:chess/data/constants/figure_color.dart';
import 'package:chess/presentation/chess_board/components/cell.dart';
import 'package:chess/presentation/chess_board/components/select_figure_dialog.dart';
import 'package:chess/presentation/chess_board/state/chess_board_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';

final class ChessBoardView extends StatelessWidget {
  const ChessBoardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocListener<ChessBoardCubit, ChessBoardState>(
          listenWhen: (previous, current) {
            return previous.lastMovedPiece != current.lastMovedPiece;
          },
          listener: (context, state) async {
            if (!(state.lastMovedPiece?.isPawn ?? false)) return;
            final piece = state.lastMovedPiece;
            if (!(piece?.isPawn ?? false)) return;
            final edge = piece?.color == FigureColor.white ? 0 : 7;
            if (piece!.position.y != edge) return;
            final newFigure = await selectFigureDialog(context, piece.color!);
            final newPiece = piece.copyWith(figure: () => newFigure);
            if (context.mounted) context.read<ChessBoardCubit>().updatePiece(newPiece);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(8, growable: false, (y) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(8, growable: false, (x) {
                  final position = (x: x, y: y);
                  final background = x % 2 == y % 2 ? ColorName.boardWhite : ColorName.boardBlack;
                  return Cell(
                    position: position,
                    background: background,
                  );
                }).toList(),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
