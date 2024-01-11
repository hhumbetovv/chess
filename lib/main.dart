import 'package:chess/presentation/chess_board/state/chess_board_cubit.dart';
import 'package:chess/presentation/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ChessBoardCubit()..initBoard(),
      child: const Chess(),
    ),
  );
}

final class Chess extends StatefulWidget {
  const Chess({
    super.key,
  });

  @override
  State<Chess> createState() => _ChessState();
}

class _ChessState extends State<Chess> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Chess Game',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const Screen(),
    );
  }
}
