import 'package:chess/presentation/chess_board/state/chess_board_cubit.dart';
import 'package:chess/presentation/chess_board/view/chess_board_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_hero/local_hero.dart';

final class Screen extends StatelessWidget {
  const Screen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Chess App'),
        actions: [
          TextButton(
            onPressed: () {
              context.read<ChessBoardCubit>().resetBoard();
            },
            child: Text(
              'Reset',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: LocalHeroScope(
            curve: Curves.ease,
            child: ChessBoardView(),
          ),
        ),
      ),
    );
  }
}
