import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static Future<T> getValue<T>(String name) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      T v = preferences.getString("setting") as T;
      return v;
    } catch (e) {
      print('Error $e');
    }

    return "" as T;
  }

  static Future<bool> save<T>(T value, String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool result = await preferences.setString(name, value as String);
    return result;
  }
}
