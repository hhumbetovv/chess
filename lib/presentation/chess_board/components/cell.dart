import 'package:chess/data/models/piece.dart';
import 'package:chess/data/types/board_list.dart';
import 'package:chess/data/types/position.dart';
import 'package:chess/presentation/chess_board/state/chess_board_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:local_hero/local_hero.dart';

final class Cell extends StatelessWidget {
  const Cell({
    required this.position,
    required this.background,
    super.key,
  });

  final Position position;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocSelector<ChessBoardCubit, ChessBoardState, Piece>(
        selector: (state) => state.board.getPiece(position),
        builder: (context, piece) {
          return InkWell(
            onTap: () {
              context.read<ChessBoardCubit>().onCellTap(piece);
            },
            child: AspectRatio(
              aspectRatio: 1,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                color: piece.isSelected ? ColorName.active : background,
                child: piece.isEmpty
                    ? CellDot(enabled: piece.isTarget)
                    : FigureIcon(
                        icon: piece.icon!,
                        tag: piece.tag!,
                        isTarget: piece.isTarget,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}

final class FigureIcon extends StatelessWidget {
  FigureIcon({
    required this.icon,
    required this.tag,
    required this.isTarget,
  }) : super(key: Key(tag));

  final String tag;
  final SvgGenImage icon;
  final bool isTarget;

  @override
  Widget build(BuildContext context) {
    return LocalHero(
      tag: tag,
      child: icon.svg(
        package: 'gen',
        colorFilter: isTarget
            ? const ColorFilter.mode(
                ColorName.danger,
                BlendMode.modulate,
              )
            : null,
      ),
    );
  }
}

final class CellDot extends StatelessWidget {
  const CellDot({
    required this.enabled,
    super.key,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        heightFactor: 0.35,
        widthFactor: 0.35,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          scale: enabled ? 1 : 0,
          child: const DecoratedBox(
            decoration: ShapeDecoration(
              shape: StadiumBorder(),
              color: ColorName.active,
            ),
          ),
        ),
      ),
    );
  }
}
