import 'package:shared_preferences/shared_preferences.dart';

class cashhelper {
  static late SharedPreferences sharedPreferences;
  static initcashhelper() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static setdata({required String key, required dynamic? value}) {
    if (value is bool) {
      return sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return sharedPreferences.setInt(key, value);
    }
    if (value is double) {
      return sharedPreferences.setDouble(key, value);
    }
    if (value is List<String>) {
      return sharedPreferences.setStringList(key, value);
    }
  }

  static getdata({required String key}) {
    return sharedPreferences.get(key);
  }

  static cleardata() {
    return sharedPreferences.clear();
  }
}
