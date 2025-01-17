import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';

enum Result { win, lose, draw }

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.resultGame});

  final Result resultGame;

  @override
  Widget build(BuildContext context) {
    final results = [
      ["Player One win!", "images/win.png"],
      ["You Lose!", "images/lose.png"],
      ["Draw!", "images/draw.png"],
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
                      child: Text(
                        "Play again",
                        style: TextStyle(
                            color: K.basicWhite,
                            fontFamily: '.SF UI Display',
                            fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {}),
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
                          onPressed: () {}),
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
