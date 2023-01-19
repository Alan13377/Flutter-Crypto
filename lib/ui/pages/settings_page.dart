import 'package:crypto_flutter/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeController = ref.watch(themeProvider);
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Settings Page",
          ),
          Switch(
            value: themeController.isDarkModeEnable,
            onChanged: (value) {
              if (value) {
                themeController.setDarkTheme();
              } else {
                themeController.setLightTheme();
              }
            },
          ),
        ],
      ),
    );
  }
}
