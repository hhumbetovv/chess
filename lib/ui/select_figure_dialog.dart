import 'package:chess/models/figures/bishop.dart';
import 'package:chess/models/figures/figure.dart';
import 'package:chess/models/figures/knight.dart';
import 'package:chess/models/figures/queen.dart';
import 'package:chess/models/figures/rook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<Figure?> selectFigureDialog(BuildContext context, FigureType type) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return SelectFigureDialog(type: type);
    },
  );
}

final class SelectFigureDialog extends StatelessWidget {
  const SelectFigureDialog({
    required this.type,
    super.key,
  });

  final FigureType type;

  @override
  Widget build(BuildContext context) {
    final figures = [
      Rook(type: type),
      Knight(type: type),
      Bishop(type: type),
      Queen(type: type),
    ];
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select a Figure',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 16,
              children: figures.map((figure) {
                return InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => Navigator.of(context).pop(figure),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      figure.icon,
                      package: 'gen',
                      // height: 64,
                      // width: 64,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
