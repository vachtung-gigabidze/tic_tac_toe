import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/models/minimax_ai.dart';
import 'package:tic_tac_toe/models/setting.dart';
import 'package:tic_tac_toe/pages/pages.dart';
import 'package:tic_tac_toe/providers/setting_provider.dart';
import 'package:tic_tac_toe/ui/ui.dart';
import 'package:collection/collection.dart';

final gameItemKey = GlobalKey();

class GameBoardScreen extends StatefulWidget {
  const GameBoardScreen(
      {super.key, required this.gameMode, required this.gameDifficulty});

  final GameMode gameMode;
  final GameDifficulty gameDifficulty;

  @override
  State<GameBoardScreen> createState() => _GameBoardScreenState();
}

class _GameBoardScreenState extends State<GameBoardScreen> {
  var board = [
    SelectType.none,
    SelectType.none,
    SelectType.none,
    SelectType.none,
    SelectType.none,
    SelectType.none,
    SelectType.none,
    SelectType.none,
    SelectType.none
  ];
  bool showWinLine = false;
  int winCombine = -1;
  SelectType priority = SelectType.first;
  late int imageIndex;

  MiniMaxAi ai = MiniMaxAi();

  void onPressedGameItem(GlobalKey key) {
    final index = keys.indexOf(key); // int.parse((key as ValueKey).value);
    setState(() {
      if (board[index] == SelectType.none) {
        board[index] = priority;

        if (checkBoard() || drawBoard()) {
          goToResult(priority);
        } else {
          priority = (priority == SelectType.first)
              ? SelectType.second
              : SelectType.first;
          aiMove();
        }
      }
    });
  }

  void aiMove() {
    //Ход ИИ
    if (widget.gameMode == GameMode.singlePlayer) {
      Future.delayed(Duration(microseconds: 100)).then(
        (value) {
          setState(() {
            //ai move
            ai.move(board, availableMove(), widget.gameDifficulty);
            //print(m);
            if (checkBoard() || drawBoard()) {
              goToResult(priority);
            } else {
              priority = (priority == SelectType.first)
                  ? SelectType.second
                  : SelectType.first;
            }
          });
        },
      );
    }
  }

  availableMove() {
    var retValue = <int>[];
    board.asMap().forEach((index, value) {
      if (value == SelectType.none) retValue.add(index);
    });

    return retValue;
  }

  final winCombines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];

  bool checkBoard() {
    winCombines.asMap().forEach((index, combine) {
      if (board[combine[0]] == board[combine[1]] &&
          board[combine[0]] == board[combine[2]] &&
          board[combine[0]] != SelectType.none) {
        winCombine = index;
        setState(() {
          showWinLine = true;
        });
      }
    });
    return showWinLine;
  }

  bool drawBoard() {
    return (board
        .where((
          x,
        ) =>
            x == SelectType.none)
        .isEmpty);
  }

  void playAgain() {
    Navigator.of(context)
      ..pop()
      ..pop();
    Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => GameBoardScreen(
              gameMode: widget.gameMode,
              gameDifficulty: widget.gameDifficulty,
            )));
  }

  void addLeaderboard(int time) {
    Setting setting = SettingProvider.of(context).setting;
    if (time > 0 && setting.gameTime) {
      List<Leaderboard> leaderboard = setting.leaderboards;
      leaderboard
          .add(Leaderboard(time: time, gameDifficulty: widget.gameDifficulty));

      setting.leaderboards = leaderboard;
      SettingProvider.of(context).saveSetting(setting);
    }
  }

  goToResult(SelectType howWin) {
    stopTimer = true;
    Timer(Duration(seconds: 1), () {
      if (board
              .where((
                x,
              ) =>
                  x == SelectType.none)
              .isEmpty &&
          winCombine == -1) {
        Navigator.of(context).push(
          CupertinoPageRoute(
              builder: (context) => ResultScreen(
                  onPlayAgain: playAgain, resultGame: Result.draw)),
        );
      } else if (howWin == SelectType.second) {
        Navigator.of(context).push(
          CupertinoPageRoute(
              builder: (context) => ResultScreen(
                  onPlayAgain: playAgain, resultGame: Result.lose)),
        );
      } else if (howWin == SelectType.first) {
        if (widget.gameMode == GameMode.singlePlayer) {
          //save leaderboard
          addLeaderboard(gameDuration ~/ 2);
          //print(gameDuration / 2);
        }
        Navigator.of(context).push(
          CupertinoPageRoute(
              builder: (context) =>
                  ResultScreen(onPlayAgain: playAgain, resultGame: Result.win)),
        );
      }
    });
  }

  int gameDuration = 0;
  bool stopTimer = false;

  final linesCoord = [
    <double>[386, 119],
    <double>[480, 119],
    <double>[574, 119],
    <double>[386, 119],
    <double>[386, 213],
    <double>[386, 307],
  ];

  final keys =
      [for (var i = 0; i < 10; i += 1) i].map((e) => GlobalKey()).toList();

  Widget drawLine() {
    late List<double> rect;
    GrowDirection direction = GrowDirection.horizontal;
    switch (winCombine) {
      case 0:
        rect = rect = linesCoord[winCombine];
        direction = GrowDirection.horizontal;
        break;
      case 1:
        rect = rect = linesCoord[winCombine];
        direction = GrowDirection.horizontal;
        break;
      case 2:
        rect = rect = linesCoord[winCombine];
        direction = GrowDirection.horizontal;
        break;
      case 3:
        rect = rect = linesCoord[winCombine];
        direction = GrowDirection.vertical;
        break;
      case 4:
        rect = rect = linesCoord[winCombine];
        direction = GrowDirection.vertical;
        break;
      case 5:
        rect = rect = linesCoord[winCombine];
        direction = GrowDirection.vertical;
        break;
      case 6:
        return DiagonalLineWidget(
          angle: 0.785398,
        );

      case 7:
        return DiagonalLineWidget(
          angle: 2.35619,
        );
      default:
        rect = linesCoord[winCombine];
    }

    return LineWidget(direction: direction, top: rect[0], left: rect[1]);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Setting setting = SettingProvider.of(context).setting;
    imageIndex = setting.selectedPairNumber;

    final items = board
        .mapIndexed((index, element) => GameItem(
            onPressed: onPressedGameItem,
            select: element,
            imageIndex: imageIndex,
            key: keys[index]))
        .toList();
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SizedIcon(name: "assets/images/back_icon.png", size: 30)),
        ),
        backgroundColor: K.basicBackground,
        child: Center(
          child: Stack(children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 390),
              child: CustomScrollView(
                primary: false,
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 110),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 103,
                                width: 103,
                                decoration: BoxDecoration(
                                    color: K.basicLightBlue,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ImageWidget(
                                          image:
                                              "assets/images/x_$imageIndex.png"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextWidget(
                                        text: "You",
                                        size: 16,
                                      )
                                    ]),
                              ),
                              if (setting.gameTime &&
                                  widget.gameMode == GameMode.singlePlayer)
                                SlideCountdown(
                                  decoration: BoxDecoration(
                                      color: K.basicBlue,
                                      borderRadius: BorderRadius.circular(10)),
                                  duration: Duration(seconds: setting.duration),
                                  onChanged: (value) {
                                    // gameDuration -= value;
                                    gameDuration += 1;
                                    if (value == Duration.zero && !stopTimer) {
                                      //You lose
                                      Navigator.of(context).push(
                                        CupertinoPageRoute(
                                            builder: (context) => ResultScreen(
                                                onPlayAgain: playAgain,
                                                resultGame: Result.lose)),
                                      );
                                    }
                                  },
                                ),
                              // TextWidget(
                              //   text: '${setting.duration}',
                              //   weight: FontWeight.bold,
                              // ),
                              Container(
                                height: 103,
                                width: 103,
                                decoration: BoxDecoration(
                                    color: K.basicLightBlue,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ImageWidget(
                                          image:
                                              "assets/images/o_$imageIndex.png"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextWidget(
                                        text: "Player Two",
                                        size: 16,
                                      )
                                    ]),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 55,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageWidget(
                                  image:
                                      "assets/images/${(priority == SelectType.first) ? "x" : "o"}_$imageIndex.png"),
                              SizedBox(
                                width: 20,
                              ),
                              TextWidget(
                                text: (priority == SelectType.first)
                                    ? "You Turn"
                                    : "Player Two Turn",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(44),
                    sliver: DecoratedSliver(
                      decoration: BoxDecoration(
                          color: K.basicWhite,
                          borderRadius: BorderRadius.circular(30)),
                      sliver: SliverPadding(
                        padding: const EdgeInsets.all(20),
                        sliver: SliverGrid.count(
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          crossAxisCount: 3,
                          children: items,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (showWinLine) drawLine(),
          ]),
        ));
  }
}

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return renderObject!.paintBounds.shift(offset);
    } else {
      return null;
    }
  }
}

enum GrowDirection { horizontal, vertical, diagonalLeft, diagonalRight }

class LineWidget extends StatelessWidget {
  const LineWidget({
    super.key,
    required this.top,
    required this.left,
    required this.direction,
  });
  final double top;
  final double left;
  final GrowDirection direction;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: (top) + (direction == GrowDirection.horizontal ? 27 : 0),
      left: (left) - (direction == GrowDirection.horizontal ? 55 : 27),
      child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 255),
          duration: const Duration(milliseconds: 500),
          builder: (context, value, child) => Container(
                width: direction == GrowDirection.horizontal ? value : 20,
                height: direction == GrowDirection.horizontal ? 20 : value,
                decoration: BoxDecoration(
                    color: K.basicBlue,
                    borderRadius: BorderRadius.circular(10)),
              )),
    );
  }
}

class DiagonalLineWidget extends StatelessWidget {
  const DiagonalLineWidget({
    super.key,
    required this.angle,
  });

  final double angle;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 505,
      left: 22,
      child: Transform.rotate(
        angle: angle, // ,
        child: Container(
          width: 340,
          height: 20,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [K.basicBlue, K.secondaryPink]),
            color: K.basicBlue,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

enum SelectType { first, second, none }

class GameItem extends StatelessWidget {
  const GameItem({
    super.key,
    this.select = SelectType.none,
    this.imageIndex = 1,
    required this.onPressed,
  });

  final SelectType select;
  final int imageIndex;
  final void Function(GlobalKey key) onPressed;

  Widget? content() {
    switch (select) {
      case SelectType.first:
        return ImageWidget(image: "assets/images/x_$imageIndex.png");
      case SelectType.second:
        return ImageWidget(image: "assets/images/o_$imageIndex.png");
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(super.key! as GlobalKey),
      child: Container(
          height: 74,
          width: 74,
          decoration: BoxDecoration(
              color: K.basicLightBlue, borderRadius: BorderRadius.circular(20)),
          child: content()),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        fit: BoxFit.scaleDown,
        child: Image.asset(
          width: 54,
          height: 54,
          image,
        ));
  }
}
