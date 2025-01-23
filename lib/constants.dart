import 'package:flutter/cupertino.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');
  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class K {
  static Color basicBlue = hexToColor('#8480D4');
  static Color basicBackground = hexToColor('#F5F7FF');
  static Color basicLightBlue = hexToColor('#E6E9F9');
  static Color basicBlack = hexToColor('#232946');
  static Color basicWhite = CupertinoColors.white;

  static Color secondaryPurple = hexToColor('#D5C1F6');
  static Color secondaryPink = hexToColor('#EF8DD1');
  static Color secondaryGray = hexToColor('#CDCFD9');
  static List<int> settingDurations = [10, 15, 20];
  static List<String> settingMusic = ["country", "donkey", "neighbour"];
  static int pairCount = 6;
}
