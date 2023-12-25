import 'package:chess/models/figure.dart';
import 'package:chess/utility/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gen/gen.dart';

final class Cell extends StatelessWidget {
  const Cell({
    required this.figure,
    required this.turn,
    required this.index,
    required this.onTap,
    this.isSelected = false,
    this.isTarget = false,
    super.key,
  });

  final Figure? figure;
  final FigureType turn;
  final CellIndex index;
  final ValueChanged<CellIndex?> onTap;
  final bool isSelected;
  final bool isTarget;

  Color get background {
    if (isSelected) return ColorName.active;
    if (index.ver % 2 == index.hor % 2) return ColorName.boardWhite;
    return ColorName.boardBlack;
  }

  void selectCell() {
    if (figure != null) {
      if (isSelected) {
        onTap(null);
      } else {
        onTap((ver: index.ver, hor: index.hor));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: figure?.type == turn ? selectCell : null,
        child: AspectRatio(
          aspectRatio: 1,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            color: background,
            child: figure != null
                ? FigureIcon(
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
  const FigureIcon({
    required this.iconPath,
    required this.isTarget,
    super.key,
  });

  final String iconPath;
  final bool isTarget;

  @override
  Widget build(BuildContext context) {
    return Center(
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
