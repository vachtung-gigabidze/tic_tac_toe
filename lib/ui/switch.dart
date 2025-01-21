import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';
// import 'package:tic_tac_toe/providers/setting_provider.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget(
      {super.key, required this.switchValue, required this.onChange});

  final bool switchValue;
  final void Function(bool) onChange;
  @override
  State<SwitchWidget> createState() => _CupertinoSwitchExampleState();
}

class _CupertinoSwitchExampleState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    bool switchValue = widget.switchValue;
    //final settingProvider = SettingProvider.of(context);
    //switchValue = settingProvider.setting.gameTime;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoSwitch(
            value: switchValue,
            activeTrackColor: K.basicBlue,
            onChanged: (bool? value) {
              // setState(() {
              switchValue = value ?? false;
              widget.onChange(value ?? false);

              //   settingProvider.setting.gameTime = value ?? false;
              //   final s = settingProvider.setting;
              //   s.gameTime = value ?? false;
              //   settingProvider.saveSetting(s);
              // });
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
    required this.value,
    required this.onChange,
  });

  final Widget text;
  final bool value;
  final void Function(bool) onChange;

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
          SwitchWidget(
            switchValue: value,
            onChange: onChange,
          ),
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
