import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';

import 'package:tic_tac_toe/ui/ui.dart';

class HowToPlayScreen extends StatelessWidget {
  const HowToPlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final instructions = [
      [
        "1",
        "Draw a grid with three rows and three columns, creating nine squares in total."
      ],
      [
        "2",
        "Players take turns placing their marker (X or O) in an empty square. To make a move, a player selects a number corresponding to the square where they want to place their marker."
      ],
      [
        "3",
        "Player X starts by choosing a square (e.g., square 5). Player O follows by choosing an empty square (e.g., square 1). Continue alternating turns until the game ends."
      ],
      [
        "4",
        "The first player to align three of their markers horizontally, vertically, or diagonally wins. Examples of Winning Combinations: Horizontal: Squares 1, 2, 3 or 4, 5, 6 or 7, 8, 9 Vertical: Squares 1, 4, 7 or 2, 5, 8 or 3, 6, 9 Diagonal: Squares 1, 5, 9 or 3, 5, 7"
      ],
    ];
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: SizedIcon(name: "images/back_icon.png", size: 30),
        middle: TextWidget(
          text: 'How To Play',
          size: 24,
          weight: FontWeight.bold,
        ),
      ),
      backgroundColor: K.basicBackground,
      child: Center(
        child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 390),
              child: Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    itemCount: instructions.length,
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                color: K.secondaryPurple,
                                borderRadius: BorderRadius.circular(22.5)),
                            child: Center(child: Text(instructions[index][0])),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 283,
                            decoration: BoxDecoration(
                                color: K.basicLightBlue,
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, left: 24, right: 24, bottom: 12),
                              child: Text(
                                instructions[index][1],
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  )),
            )),
      ),
    );
  }
}
