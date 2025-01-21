import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/models/setting.dart';
import 'package:tic_tac_toe/pages/game_board/page.dart';
import 'package:tic_tac_toe/pages/select_game/page.dart';

enum Result { win, lose, draw }

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.resultGame, required this.onPlayAgain});

  final Result resultGame;
  final VoidCallback onPlayAgain;

  @override
  Widget build(BuildContext context) {
    final results = [
      ["Player One win!", "assets/images/win.png"],
      ["You Lose!", "assets/images/lose.png"],
      ["Draw!", "assets/images/draw.png"],
    ];
    final result = results[resultGame.index];
    return CupertinoPageScaffold(
      backgroundColor: K.basicBackground,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    result[0],
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: '.SF UI Display',
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 228, width: 228, child: Image.asset(result[1])),
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
            child: Column(
              children: [
                SizedBox(
                  width: 348,
                  height: 72,
                  child: CupertinoButton(
                      sizeStyle: CupertinoButtonSize.large,
                      color: K.basicBlue,
                      borderRadius: BorderRadius.circular(36),
                      onPressed: onPlayAgain,
                      child: Text(
                        "Play again",
                        style: TextStyle(
                            color: K.basicWhite,
                            fontFamily: '.SF UI Display',
                            fontWeight: FontWeight.w700),
                      )
                      //  () {
                      //   Navigator.of(context).pop();
                      //   // Navigator.of(context).push(
                      //   //   CupertinoPageRoute(
                      //   //       builder: (context) => const GameBoardScreen(
                      //   //             gameMode: GameMode.singlePlayer,
                      //   //             gameDifficulty: GameDifficulty.easy,
                      //   //           )),
                      //   //);
                      // }
                      ),
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: 348,
                  height: 72,
                  child: Container(
                    decoration: BoxDecoration(
                      color: K.basicBlue,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CupertinoButton(
                          sizeStyle: CupertinoButtonSize.large,
                          color: K.basicWhite,
                          borderRadius: BorderRadius.circular(36),
                          child: Text(
                            "Back",
                            style: TextStyle(
                                color: K.basicBlue,
                                fontFamily: '.SF UI Display',
                                fontWeight: FontWeight.w700),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                              ..pop()
                              ..pop();
                            // Navigator.of(context).push(
                            //   CupertinoPageRoute(
                            //       builder: (context) =>
                            //           const SelectGameScreen()),
                            // );
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
