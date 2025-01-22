import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/ui/sized_icon.dart';
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
        color: K.basicBackground,
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
        padding: const EdgeInsets.only(left: 20.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            text,
            SwitchWidget(
              switchValue: value,
              onChange: onChange,
            ),
          ],
        ),
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
        color: K.basicBackground,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            text,
            icon,
          ],
        ),
      ),
    );
  }
}

class DropDownButtonWidget<T> extends StatefulWidget {
  const DropDownButtonWidget({
    super.key,
    required this.label,
    required this.selectedItem,
    required this.items,
    required this.updateSetting,
    required this.selectValue,
  });

  final Widget label;
  final Widget selectedItem;
  final T selectValue;
  final List<T> items;
  final void Function(T) updateSetting;

  @override
  State<DropDownButtonWidget<T>> createState() =>
      _DropDownButtonWidgetState<T>();
}

class _DropDownButtonWidgetState<T> extends State<DropDownButtonWidget<T>> {
  bool showItems = false;
  double _targetValue = 60.0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = widget.items
        .map((e) => GestureDetector(
              onTap: () {
                setState(() {
                  _targetValue = _targetValue == 215 ? 60 : 215;
                  showItems = !showItems;
                  T value = e;
                  widget.updateSetting(value);
                });
              },
              child: Container(
                height: 44,
                width: 308,
                decoration: BoxDecoration(
                  color: (e == widget.selectValue)
                      ? K.basicLightBlue
                      : K.basicBackground,
                ),
                child: Center(
                  child: TextWidget(
                    text: "$e",
                    size: 16,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            ))
        .toList();
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: _targetValue),
      curve: Curves.elasticOut,
      duration: const Duration(milliseconds: 900),
      builder: (context, value, child) => Container(
        height: value, //60
        width: 270,
        decoration: BoxDecoration(
          color: K.basicBackground,
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
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _targetValue = _targetValue == 215 ? 60 : 215;
                      showItems = !showItems;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.label,
                        widget.selectedItem,
                      ],
                    ),
                  ),
                ),
                if (showItems)
                  Container(
                    width: 260,
                    height: 2,
                    decoration: BoxDecoration(color: K.basicBlue),
                  ),
                if (showItems) ...items,
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
