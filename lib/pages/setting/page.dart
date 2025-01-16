import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/ui/ui.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: SizedIcon(name: "images/back_icon.png", size: 30),
        ),
        backgroundColor: K.secondaryGray,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SwitchButtonWidget(
                text: TextWidget(
                  text: "Turing on the time",
                  size: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              IconButtonWidget(
                text: TextWidget(
                  text: "Time for game 2:00",
                  size: 16,
                ),
                icon: CupertinoActionSheetAction(
                  onPressed: () {},
                  child: Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                        color: K.secondaryGray,
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
              Container(
                height: 150,
                width: 152,
                decoration: BoxDecoration(
                    color: K.basicWhite,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          SizedIcon(
                            name: "images/x_1.png",
                            size: 54,
                          ),
                          SizedIcon(
                            name: "images/o_1.png",
                            size: 54,
                          )
                        ],
                      ),
                      ButtonWidget(
                        text: ColoredBox(
                          color: K.basicBlack,
                          child: TextWidget(
                            text: "Picked",
                            size: 16,
                          ),
                        ),
                        width: 112,
                        height: 39,
                        icon: null,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
