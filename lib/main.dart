import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/pages/pages.dart';
import 'package:tic_tac_toe/providers/setting_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingStateWidget(
      child: CupertinoApp(
        title: 'TicTacToe',
        theme: CupertinoThemeData(brightness: Brightness.light),
        // color: CupertinoColors.black,
        debugShowCheckedModeBanner: false,
        // home: const GameBoardScreen(
        //   gameMode: GameMode.singlePlayer,
        //   gameDifficulty: GameDifficulty.easy,
        // ),
        // home: const SettingScreen(),
        home: OnboardingScreen(),
        // home: ResultScreen(onPlayAgain: () {}, resultGame: Result.draw),
      ),
    );
  }
}
