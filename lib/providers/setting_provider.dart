import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/models/setting.dart';

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
