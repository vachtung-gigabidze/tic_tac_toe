import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/ui/ui.dart';

class SelectGameScreen extends StatelessWidget {
  const SelectGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: SizedIcon(name: "images/setting_icon.png", size: 36),
      ),
      backgroundColor: K.basicLightBlue,
      child: Center(
        child: Container(
          height: 247,
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
                text: TextWidget(text: "Single Player"),
                icon: SizedIcon(
                  name: "images/single_player_icon.png",
                  size: 38,
                ),
              ),
              SizedBox(height: 20),
              ButtonWidget(
                text: TextWidget(text: "Two Player"),
                icon: SizedIcon(
                  name: "images/two_players_icon.png",
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
