import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/ui/ui.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String timeOfGame = "2:00";
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: SizedIcon(name: "images/back_icon.png", size: 30),
        ),
        backgroundColor: K.basicLightBlue,
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
                        SwitchButtonWidget(
                          text: TextWidget(
                            text: "Turn on the time",
                            size: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        IconButtonWidget(
                          text: TextWidget(
                            text: "Time for game $timeOfGame",
                            size: 16,
                          ),
                          icon: CupertinoActionSheetAction(
                            onPressed: () {},
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  color: K.basicLightBlue,
                                  borderRadius: BorderRadius.circular(14)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.5),
                                child: SizedIcon(
                                  name: "images/arrow_left.png",
                                  size: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 40, left: 33, right: 33),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                    children: <Widget>[
                      SettingPairChoice(
                        element: 1,
                        selected: true,
                      ),
                      SettingPairChoice(
                        element: 2,
                      ),
                      SettingPairChoice(
                        element: 3,
                      ),
                      SettingPairChoice(
                        element: 4,
                      ),
                      SettingPairChoice(
                        element: 5,
                      ),
                      SettingPairChoice(
                        element: 6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class SettingPairChoice extends StatelessWidget {
  const SettingPairChoice({
    super.key,
    required this.element,
    this.selected = false,
  });

  final int element;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 152,
      decoration: BoxDecoration(
        color: K.basicWhite,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: K.basicLightBlue,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedIcon(
                  name: "images/x_$element.png",
                  size: 54,
                ),
                SizedBox(
                  width: 4,
                ),
                SizedIcon(
                  name: "images/o_$element.png",
                  size: 54,
                )
              ],
            ),
            ButtonWidget(
              text: TextWidget(
                text: selected ? "Picked" : "Choose",
                size: 16,
                weight: FontWeight.w700,
                color: selected ? K.basicWhite : K.basicBlack,
              ),
              width: 112,
              height: 39,
              icon: null,
              color: selected ? K.basicBlue : K.basicLightBlue,
            ),
          ],
        ),
      ),
    );
  }
}
