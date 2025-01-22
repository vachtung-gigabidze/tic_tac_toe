import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/providers/setting_provider.dart';

import 'package:tic_tac_toe/ui/ui.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingProvider = SettingProvider.of(context);
    final setting = settingProvider.setting;
    final instructions = setting.leaderboards;
    instructions.sort((a, b) => a.time.compareTo(b.time));
    // ["1", "Best time 00:20"],
    // ["2", "Time 00:20"],
    // ["3", "Time 00:20"],
    // ["4", "Time 00:20"],
    // ["5", "Time 00:20"],

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SizedIcon(name: "assets/images/back_icon.png", size: 30)),
        middle: TextWidget(
          text: 'Leaderboard',
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
                  child: instructions.isEmpty
                      ? EmptyLeaderboard()
                      : ListView.separated(
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
                                  width: 69,
                                  height: 69,
                                  decoration: BoxDecoration(
                                      color: K.secondaryPurple,
                                      borderRadius: BorderRadius.circular(35)),
                                  child: Center(child: Text('${index + 1}')),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 269,
                                  height: 69,
                                  decoration: BoxDecoration(
                                      color: K.basicLightBlue,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 24,
                                      right: 24,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${index + 1 == 1 ? "Best time 00:" : "Time 00:"}${instructions[index].time}',
                                      ),
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

class EmptyLeaderboard extends StatelessWidget {
  const EmptyLeaderboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 145,
              child: TextWidget(text: "No game history with turn on time")),
          SizedBox(
            height: 40,
          ),
          Image.asset(
            "assets/images/robot.png",
            height: 228,
            width: 177,
          ),
        ],
      ),
    );
  }
}
