import 'package:crypto_flutter/ui/pages/home_page.dart';
import 'package:crypto_flutter/ui/pages/prices_coins.dart';
import 'package:crypto_flutter/ui/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavProvider = ChangeNotifierProvider((ref) => ButtomNavProvider());

class ButtomNavProvider extends ChangeNotifier {
  int currentIndex = 0;

  List<BottomNavigationBarItem> items = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.schedule),
      label: 'Portafolio',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.double_arrow_sharp),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.signal_cellular_alt),
      label: 'Prices',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];
  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  navigateTo() {
    switch (currentIndex) {
      case 0:
        return const HomePage();

      case 3:
        return const PricesCoins();
      case 4:
        return const SettingsPage();
      default:
        return const HomePage();
    }
  }
}
