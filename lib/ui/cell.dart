import 'package:chess/constants/cell_action.dart';
import 'package:chess/models/cell_index.dart';
import 'package:chess/models/figures/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gen/gen.dart';
import 'package:local_hero/local_hero.dart';

final class Cell extends StatelessWidget {
  const Cell({
    required this.figure,
    required this.index,
    required this.onTap,
    required this.turn,
    this.isSelected = false,
    this.isTarget = false,
    super.key,
  });

  final Figure? figure;
  final CellIndex index;
  final void Function(CellIndex?, CellAction) onTap;
  final FigureType turn;
  final bool isSelected;
  final bool isTarget;

  Color get background {
    if (isSelected) return ColorName.active;
    if (index.ver % 2 == index.hor % 2) return ColorName.boardWhite;
    return ColorName.boardBlack;
  }

  void onCellTap() {
    if (figure?.type == turn) {
      onTap(index, isSelected ? CellAction.unselect : CellAction.select);
    } else if (isTarget) {
      onTap(index, CellAction.move);
    } else {
      onTap(null, CellAction.unselect);
    }
  }

  bool get isClickable {
    return figure?.type == turn || isTarget;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onCellTap,
        child: AspectRatio(
          aspectRatio: 1,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            color: background,
            child: figure != null
                ? FigureIcon(
                    tag: figure!.id,
                    iconPath: figure!.icon,
                    isTarget: isTarget,
                  )
                : CellDot(enabled: isTarget),
          ),
        ),
      ),
    );
  }
}

final class FigureIcon extends StatelessWidget {
  FigureIcon({
    required this.tag,
    required this.iconPath,
    required this.isTarget,
  }) : super(key: Key(tag));

  final String tag;
  final String iconPath;
  final bool isTarget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LocalHero(
        tag: tag,
        child: SvgPicture.asset(
          iconPath,
          package: 'gen',
          colorFilter: isTarget
              ? const ColorFilter.mode(
                  ColorName.danger,
                  BlendMode.modulate,
                )
              : null,
        ),
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
