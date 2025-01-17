import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/ui/ui.dart';

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
