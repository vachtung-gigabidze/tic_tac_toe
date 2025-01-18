import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/providers/setting_provider.dart';

import 'package:tic_tac_toe/ui/ui.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final String timeOfGame = "2:00";
    final int selected = 1;
    final setting = SettingProvider.of(context)?.setting;
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
        child: Center(
          child: ConstrainedBox(
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
                            text: "Time for game ${setting?.duration ?? 0}",
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
                                  name: "assets/images/arrow_left.png",
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
                        selected: selected == 1,
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
