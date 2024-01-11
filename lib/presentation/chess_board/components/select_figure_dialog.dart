import 'package:flutter/material.dart';

import '../../../data/constants/figure_color.dart';
import '../../../data/models/figures/figure.dart';
import '../../../data/models/figures/index.dart';

Future<Figure?> selectFigureDialog(BuildContext context, FigureColor color) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return SelectFigureDialog(color: color);
    },
  );
}

final class SelectFigureDialog extends StatelessWidget {
  const SelectFigureDialog({
    required this.color,
    super.key,
  });

  final FigureColor color;

  @override
  Widget build(BuildContext context) {
    final figures = [
      Rook(color: color),
      Knight(color: color),
      Bishop(color: color),
      Queen(color: color),
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
                    child: figure.getIcon.svg(package: 'gen'),
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
