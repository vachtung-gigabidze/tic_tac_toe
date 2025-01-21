import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/providers/setting_provider.dart';

import 'package:tic_tac_toe/ui/ui.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    //final String timeOfGame = "2:00";
    final settingProvider = SettingProvider.of(context);
    final setting = settingProvider.setting;
    final int selected = setting.selectedPairNumber;
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
                          value: setting.gameTime,
                          onChange: (bool value) {
                            settingProvider.setting.gameTime = value ?? false;
                            final s = settingProvider.setting;
                            s.gameTime = value ?? false;
                            settingProvider.saveSetting(s);
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        IconButtonWidget(
                          text: TextWidget(
                            text: "Time for game ${setting.duration}",
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
                    children: [for (var i = 1; i <= 6; i += 1) i]
                        .map(
                          (e) => SettingPairChoice(
                            element: e,
                            selected: selected == e,
                            onPressed: () {
                              setState(() {
                                settingProvider.setting.selectedPairNumber = e;
                                final s = settingProvider.setting;

                                settingProvider.saveSetting(s);
                              });
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
