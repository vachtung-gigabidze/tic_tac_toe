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
                    child: Container(
                      // width: 308,
                      decoration: BoxDecoration(
                        color: K.basicWhite,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SwitchButtonWidget(
                              text: TextWidget(
                                text: "Game Time",
                                size: 16,
                              ),
                              value: setting.gameTime,
                              onChange: (bool value) {
                                setState(() {
                                  setting.gameTime = value;
                                  final s = settingProvider.setting;
                                  s.gameTime = value;
                                  settingProvider.saveSetting(s);
                                });
                              },
                            ),
                            if (setting.gameTime) ...[
                              SizedBox(
                                height: 20,
                              ),
                              DropDownButtonWidget<int>(
                                label: TextWidget(
                                  text: "Duration ",
                                  size: 16,
                                ),
                                selectedItem: TextWidget(
                                  text: "${setting.duration} sec",
                                  size: 16,
                                  weight: FontWeight.bold,
                                ),
                                selectValue: setting.duration,
                                items: K.settingDurations,
                                updateSetting: (value) {
                                  setState(() {
                                    setting.duration = value;
                                    final s = settingProvider.setting;
                                    s.duration = value;
                                    settingProvider.saveSetting(s);
                                  });
                                },
                              ),
                            ],
                            SizedBox(
                              height: 20,
                            ),
                            SwitchButtonWidget(
                              text: TextWidget(
                                text: "Music",
                                size: 16,
                              ),
                              value: setting.musicEnable,
                              onChange: (bool value) {
                                setState(() {
                                  setting.musicEnable = value;
                                  final s = settingProvider.setting;
                                  s.musicEnable = value;
                                  settingProvider.saveSetting(s);
                                });
                              },
                            ),
                            if (setting.musicEnable) ...[
                              SizedBox(
                                height: 20,
                              ),
                              DropDownButtonWidget<String>(
                                label: TextWidget(
                                  text: "Select Music ",
                                  size: 16,
                                ),
                                selectedItem: TextWidget(
                                  text: setting.selectedMusic,
                                  size: 16,
                                  weight: FontWeight.bold,
                                ),
                                selectValue: setting.selectedMusic,
                                items: K.settingMusic,
                                updateSetting: (value) {
                                  setState(() {
                                    setting.selectedMusic = value;
                                    final s = settingProvider.setting;
                                    s.selectedMusic = value;
                                    settingProvider.saveSetting(s);
                                  });
                                },
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 40, left: 33, right: 33),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                    children: [for (var i = 1; i <= K.pairCount; i += 1) i]
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
