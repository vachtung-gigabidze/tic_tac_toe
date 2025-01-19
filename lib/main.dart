import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/pages/pages.dart';
import 'package:tic_tac_toe/providers/setting_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SettingStateWidget(

        // child: const GameBoardScreen()));
        child: CupertinoApp(
            title: 'TicTacToe',
            theme: CupertinoThemeData(brightness: Brightness.light),
            // color: CupertinoColors.black,
            debugShowCheckedModeBanner: false,
            home: const OnboardingScreen()));
    // home: const ResultScreen(resultGame: Result.draw));
  }
}
