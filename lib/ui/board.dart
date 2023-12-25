import 'package:chess/ui/board_controller.dart';
import 'package:chess/ui/cell.dart';
import 'package:flutter/material.dart';

final class Board extends StatefulWidget {
  const Board({
    super.key,
  });

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> with BoardController {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(8, (vIndex) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(8, (hIndex) {
                final index = (ver: vIndex, hor: hIndex);
                return Cell(
                  turn: turn,
                  index: index,
                  onTap: cellOnTap,
                  isTarget: targets.contains(index),
                  isSelected: checkIsSelected(index),
                  figure: board[vIndex][hIndex],
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}
