import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'TicTacToe',
      theme: CupertinoThemeData(),
      color: CupertinoColors.black,
      debugShowCheckedModeBanner: false,
      home: const SelectGameScreen(),
    );
  }
}
