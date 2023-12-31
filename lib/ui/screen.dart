import 'package:chess/ui/board.dart';
import 'package:flutter/material.dart';
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
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: LocalHeroScope(
            curve: Curves.easeInOut,
            child: Board(),
          ),
        ),
      ),
    );
  }
}
