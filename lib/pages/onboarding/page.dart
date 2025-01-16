import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/ui/ui.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: SizedIcon(
          name: "images/question_icon.png",
          size: 36,
        ),
        trailing: SizedIcon(name: "images/setting_icon.png", size: 36),
      ),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 135,
                      width: 207,
                      child: Image.asset("images/XO.png")),
                  Text(
                    "TIC-TAC-TOE",
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: '.SF UI Display',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 21,
              right: 21,
              bottom: 80,
            ),
            child: SizedBox(
              width: 348,
              height: 72,
              child: CupertinoButton(
                  sizeStyle: CupertinoButtonSize.large,
                  color: K.basicBlue,
                  borderRadius: BorderRadius.circular(36),
                  child: Text(
                    "Let's play",
                    style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 20,
                        fontFamily: '.SF UI Display',
                        fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
