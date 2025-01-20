import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/models/setting.dart';
import 'package:tic_tac_toe/pages/pages.dart';
import 'package:tic_tac_toe/ui/ui.dart';

class SelectGameScreen extends StatelessWidget {
  const SelectGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        trailing: PushWidget(
            goTo: const SettingScreen(),
            child: SizedIcon(name: "assets/images/setting_icon.png", size: 36)),
      ),
      backgroundColor: K.basicBackground,
      child: Center(
        child: Container(
          height: 336,
          width: 285,
          decoration: BoxDecoration(
              color: K.basicWhite, borderRadius: BorderRadius.circular(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                text: "Select Game",
                size: 24,
                weight: FontWeight.bold,
              ),
              SizedBox(height: 20),
              ButtonWidget(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                        builder: (context) => const GameDifficultyScreen()),
                  );
                },
                text: TextWidget(text: "Single Player"),
                icon: SizedIcon(
                  name: "assets/images/single_player_icon.png",
                  size: 38,
                ),
              ),
              SizedBox(height: 20),
              ButtonWidget(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                        builder: (context) => const GameBoardScreen(
                              gameMode: GameMode.twoPlayer,
                              gameDifficulty: GameDifficulty.easy,
                            )),
                  );
                },
                text: TextWidget(text: "Two Player"),
                icon: SizedIcon(
                  name: "assets/images/two_players_icon.png",
                  size: 38,
                ),
              ),
              SizedBox(height: 20),
              ButtonWidget(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                        builder: (context) => const LeaderboardScreen()),
                  );
                },
                text: TextWidget(text: "Leaderboard"),
                icon: SizedIcon(
                  name: "assets/images/leaderboard.png",
                  size: 38,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
