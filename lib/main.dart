import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/models/setting.dart';
import 'package:tic_tac_toe/pages/pages.dart';
import 'package:tic_tac_toe/providers/setting_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // Setting s =
  // bool result = await preferences.setString("setting", s.toJson());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        title: 'TicTacToe',
        theme: CupertinoThemeData(brightness: Brightness.light),
        // color: CupertinoColors.black,
        debugShowCheckedModeBanner: false,
        home: SettingProvider(
            setting: Setting(
                gameTime: true,
                duration: 120,
                musicEnable: false,
                selectedMusic: "country.mp3",
                player1Image: "x_1.png",
                player2Image: "o_1.png",
                selectedPairNumber: 1),
            // child: const GameBoardScreen()));
            child: const OnboardingScreen()));
    // home: const ResultScreen(resultGame: Result.draw));
  }
}
