import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/models/setting.dart';
import 'package:tic_tac_toe/pages/how_to_play/page.dart';
import 'package:tic_tac_toe/pages/select_game/page.dart';
import 'package:tic_tac_toe/pages/setting/page.dart';
import 'package:tic_tac_toe/services/shared_preferences_service.dart';
import 'package:tic_tac_toe/ui/ui.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  Future<int> pair() async {
    // String? value = await SharedPreferencesService.getValue<String?>("setting");
    // if (value != null) {
    //   final s = Setting.fromJson(value);
    //   return s.selectedPairNumber;
    // }
    return Random().nextInt(K.pairCount) + 1;
    // print("pair");
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: PushWidget(
            goTo: const HowToPlayScreen(),
            child: SizedIcon(
              name: "assets/images/question_icon.png",
              size: 36,
            )),
        trailing: PushWidget(
            goTo: const SettingScreen(),
            child: SizedIcon(name: "assets/images/setting_icon.png", size: 36)),
      ),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder(
                      future: pair(),
                      builder: (context, AsyncSnapshot<int> snapshot) {
                        final pair = (snapshot.hasData) ? snapshot.data : 1;

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 108,
                                width: 108,
                                child: Image.asset(
                                  "assets/images/x_$pair.png",
                                  fit: BoxFit.scaleDown,
                                )),
                            SizedBox(
                                height: 135,
                                width: 136,
                                child: Image.asset(
                                  "assets/images/o_$pair.png",
                                  fit: BoxFit.fill,
                                )),
                          ],
                        );
                      }),
                  Text(
                    "TIC-TAC-TOE",
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: '.SF UI Display',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 21,
              right: 21,
              bottom: 80,
            ),
            child: SizedBox(
              width: 348,
              height: 72,
              child: CupertinoButton(
                  sizeStyle: CupertinoButtonSize.large,
                  color: K.basicBlue,
                  borderRadius: BorderRadius.circular(36),
                  child: Text(
                    "Let's play",
                    style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 20,
                        fontFamily: '.SF UI Display',
                        fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {
                    AudioPlayer().play(AssetSource('songs/country.mp3'));

                    Navigator.of(context).push(
                      CupertinoPageRoute(
                          builder: (context) => const SelectGameScreen()),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
