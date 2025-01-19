import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_toe/models/setting.dart';

class SettingStateWidget extends StatefulWidget {
  const SettingStateWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<SettingStateWidget> createState() => _SettingStateWidgetState();
}

class _SettingStateWidgetState extends State<SettingStateWidget> {
  late Setting setting;

  Future<Setting> loadSetting() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return Setting.fromJson(jsonDecode(preferences.getString("setting")!));
  }

  void saveSetting(Setting setting) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool result = await preferences.setString("setting", setting.toJson());
  }

  // bool result = await preferences.setString("setting", s.toJson());

  @override
  void initState() {
    setting = Setting(
        gameTime: true,
        duration: 120,
        musicEnable: false,
        selectedMusic: "country.mp3",
        selectedPairNumber: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Setting>(
        future: loadSetting(),
        initialData: setting,
        builder: (context, AsyncSnapshot<Setting> snapshot) {
          if (!snapshot.hasData) {
            return SettingProvider(
              setting: setting,
              child: widget.child,
            );
          } else {
            final s = snapshot.data;
            return SettingProvider(
              setting: s ?? setting,
              child: widget.child,
            );
          }
        });
  }
}

class SettingProvider extends InheritedWidget {
  const SettingProvider({required this.setting, super.key, required this.child})
      : super(child: child);
  final Setting setting;
  @override
  final Widget child;

  // static SettingProvider? maybeOf(BuildContext context) {
  //   return context.dependOnInheritedWidgetOfExactType<SettingProvider>();
  // }

  static SettingProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SettingProvider>()
        as SettingProvider;
  }

  @override
  bool updateShouldNotify(SettingProvider oldWidget) {
    return oldWidget.setting != setting;
  }
}
