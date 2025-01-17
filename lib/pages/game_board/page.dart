import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/ui/ui.dart';

final gameItemKey = GlobalKey();

class GameBoardScreen extends StatelessWidget {
  const GameBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final int selected = 1;
    // final bool turnTime = false;
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SizedIcon(name: "assets/images/back_icon.png", size: 30)),
        ),
        backgroundColor: K.basicBackground,
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
                                    ImageWidget(image: "assets/images/x_1.png"),
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
                                    ImageWidget(image: "assets/images/o_1.png"),
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
                            ImageWidget(image: "assets/images/o_1.png"),
                            SizedBox(
                              width: 20,
                            ),
                            TextWidget(text: "You turn"),
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
                        children: <Widget>[
                          GameItem(),
                          GameItem(
                            select: SelectType.second,
                          ),
                          GameItem(),
                          GameItem(
                            key: gameItemKey,
                            select: SelectType.first,
                          ),
                          GameItem(
                            select: SelectType.first,
                          ),
                          GameItem(
                            select: SelectType.first,
                          ),
                          GameItem(),
                          GameItem(
                            select: SelectType.second,
                          ),
                          GameItem(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          LineWidget()
        ]));
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

class LineWidget extends StatelessWidget {
  const LineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final b = gameItemKey.globalPaintBounds;
    return Positioned(
        top: (b?.top ?? 445) + 27,
        left: (b?.left ?? 67) + 3,
        child: Container(
          width: 255,
          height: 20,
          decoration: BoxDecoration(
              color: K.basicBlue, borderRadius: BorderRadius.circular(10)),
        ));
  }
}

enum SelectType { first, second, none }

class GameItem extends StatelessWidget {
  const GameItem({
    super.key,
    this.select = SelectType.none,
  });

  final SelectType select;

  Widget? content() {
    switch (select) {
      case SelectType.first:
        return ImageWidget(image: "assets/images/x_1.png");
      case SelectType.second:
        return ImageWidget(image: "assets/images/o_1.png");
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 74,
        width: 74,
        decoration: BoxDecoration(
            color: K.basicLightBlue, borderRadius: BorderRadius.circular(20)),
        child: content());
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
