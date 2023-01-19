import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = ChangeNotifierProvider((ref) => ThemeProvider());

class ThemeProvider extends ChangeNotifier {
  bool isDarkModeEnable = false;
  bool _isExpanded = true;

  bool get isExpanded => _isExpanded;

  set isExpanded(bool isExpanded) {
    _isExpanded = isExpanded;
    notifyListeners();
  }

  late SharedPreferences prefs;

  ThemeProvider() {
    _init();
  }
  Future _init() async {
    prefs = await SharedPreferences.getInstance();
    var darkMode = prefs.getBool("darkMode");
    isDarkModeEnable = darkMode ?? false;
    notifyListeners();
  }

  void setLightTheme() {
    isDarkModeEnable = false;
    prefs.setBool("darkMode", isDarkModeEnable);
    notifyListeners();
  }

  void setDarkTheme() {
    isDarkModeEnable = true;
    prefs.setBool("darkMode", isDarkModeEnable);
    notifyListeners();
  }
}
