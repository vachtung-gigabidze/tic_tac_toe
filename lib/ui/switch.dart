import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _CupertinoSwitchExampleState();
}

class _CupertinoSwitchExampleState extends State<SwitchWidget> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoSwitch(
            value: switchValue,
            activeTrackColor: K.basicBlue,
            onChanged: (bool? value) {
              setState(() {
                switchValue = value ?? false;
              });
            },
          ),
        ],
      ),
    );
  }
}

class SwitchButtonWidget extends StatelessWidget {
  const SwitchButtonWidget({
    super.key,
    required this.text,
  });

  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 270,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          text,
          SwitchWidget(),
        ],
      ),
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.text,
    required this.icon,
  });

  final Widget text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 270,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          text,
          icon,
        ],
      ),
    );
  }
}
