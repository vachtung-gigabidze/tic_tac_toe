import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';

import 'package:tic_tac_toe/ui/ui.dart';

class GameBoardScreen extends StatelessWidget {
  const GameBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int selected = 1;
    // final bool turnTime = false;
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: SizedIcon(name: "images/back_icon.png", size: 30),
        ),
        backgroundColor: K.basicBackground,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 390),
            child: CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.only(top: 50),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(children: [
                              ImageWidget(image: "images/x_1.png"),
                              SizedBox(
                                height: 10,
                              ),
                              TextWidget(
                                text: "You",
                                size: 16,
                              )
                            ]),
                            Column(children: [
                              ImageWidget(image: "images/o_1.png"),
                              SizedBox(
                                height: 10,
                              ),
                              TextWidget(
                                text: "Player Two",
                                size: 16,
                              )
                            ])
                          ],
                        ),
                        SizedBox(
                          height: 55,
                        ),
                        TextWidget(text: "You turn"),
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
                          GameItem(),
                          GameItem(),
                          GameItem(
                            select: SelectType.first,
                          ),
                          GameItem(),
                          GameItem(),
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
        return ImageWidget(image: "images/x_1.png");
      case SelectType.second:
        return ImageWidget(image: "images/o_1.png");
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
