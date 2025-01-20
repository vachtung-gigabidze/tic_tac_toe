import 'dart:async';

import 'package:flutter/cupertino.dart';
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

        if (checkBoard()) {
          goToResult(priority);
        } else {
          priority = (priority == SelectType.first)
              ? SelectType.second
              : SelectType.first;
        }
      }
    });

    // //Ход ИИ
    // if (widget.gameMode == GameMode.singlePlayer) {
    //   Future.delayed(Duration(seconds: 1));
    //   //ai move
    //   int m = ai.move(board, availableMove());
    //   print(m);
    //   priority =
    //       (priority == SelectType.first) ? SelectType.second : SelectType.first;
    //   checkBoard();
    // }
  }

  availableMove() {
    var retValue = <int>[];
    board.asMap().forEach((index, value) {
      if (value == SelectType.none) retValue.add(index);
    });
    print(retValue);
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

  goToResult(SelectType howWin) {
    Timer(Duration(seconds: 3), () {
      if (howWin == SelectType.second) {
        Navigator.of(context).push(
          CupertinoPageRoute(
              builder: (context) => ResultScreen(resultGame: Result.lose)),
        );
      } else if (howWin == SelectType.first) {
        Navigator.of(context).push(
          CupertinoPageRoute(
              builder: (context) => ResultScreen(resultGame: Result.win)),
        );
      } else if (board
          .where((
            x,
          ) =>
              x == SelectType.none)
          .isEmpty) {
        Navigator.of(context).push(
          CupertinoPageRoute(
              builder: (context) => ResultScreen(resultGame: Result.draw)),
        );
      }
    });
  }

  final keys =
      [for (var i = 0; i < 10; i += 1) i].map((e) => GlobalKey()).toList();

  Widget drawLine() {
    Rect? rect;
    GrowDirection direction = GrowDirection.horizontal;
    switch (winCombine) {
      case 0:
        rect = keys[0].globalPaintBounds;
        direction = GrowDirection.horizontal;
        break;
      case 1:
        rect = keys[3].globalPaintBounds;
        direction = GrowDirection.horizontal;
        break;
      case 2:
        rect = keys[6].globalPaintBounds;
        direction = GrowDirection.horizontal;
        break;
      case 3:
        rect = keys[0].globalPaintBounds;
        direction = GrowDirection.vertical;
        break;
      case 4:
        rect = keys[1].globalPaintBounds;
        direction = GrowDirection.vertical;
        break;
      case 5:
        rect = keys[2].globalPaintBounds;
        direction = GrowDirection.vertical;
        break;
      case 6:
        rect = keys[0].globalPaintBounds;
        direction = GrowDirection.diagonal;
        break;
      case 7:
        rect = keys[2].globalPaintBounds;
        direction = GrowDirection.diagonal;
        break;
    }

    if (rect != null) {
      return LineWidget(direction: direction, top: rect.top, left: rect.left);
    }
    return LineWidget(direction: direction, top: 0, left: 0);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final int selected = 1;
    // final bool turnTime = false;
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
                              TextWidget(
                                text: "1:59",
                                weight: FontWeight.bold,
                              ),
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
            if (showWinLine) drawLine()
          ]),
        ));
  }
}

//Для получения глобальных координат
extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final matrix = renderObject?.getTransformTo(null);

    if (matrix != null && renderObject?.paintBounds != null) {
      final rect = MatrixUtils.transformRect(matrix, renderObject!.paintBounds);
      return rect;
    } else {
      return null;
    }
  }
}

enum GrowDirection { horizontal, vertical, diagonal }

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
    //final b = gameItemKey.globalPaintBounds;

    return Positioned(
      top: (top) + (direction == GrowDirection.horizontal ? 27 : 0),
      left: (left) - (direction == GrowDirection.horizontal ? 55 : 27),
      child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 255),
          duration: const Duration(seconds: 1),
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
