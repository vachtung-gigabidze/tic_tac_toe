import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/pages/pages.dart';
import 'package:tic_tac_toe/ui/ui.dart';

class GameDifficultyScreen extends StatelessWidget {
  const GameDifficultyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SizedIcon(name: "assets/images/back_icon.png", size: 30)),
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
                          builder: (context) => const GameBoardScreen()),
                    );
                  },
                  text: TextWidget(text: "Easy"),
                  icon: null),
              SizedBox(height: 20),
              ButtonWidget(
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                          builder: (context) => const GameBoardScreen()),
                    );
                  },
                  text: TextWidget(text: "Standard"),
                  icon: null),
              SizedBox(height: 20),
              ButtonWidget(
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                          builder: (context) => const GameBoardScreen()),
                    );
                  },
                  text: TextWidget(text: "Hard"),
                  icon: null),
            ],
          ),
        ),
      ),
    );
  }
}
