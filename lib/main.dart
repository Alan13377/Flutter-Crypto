import 'package:crypto_flutter/providers/theme_provider.dart';
import 'package:crypto_flutter/ui/pages/base_scaffold.dart';
import 'package:crypto_flutter/ui/themes/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeController = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      themeMode:
          themeController.isDarkModeEnable ? ThemeMode.dark : ThemeMode.light,
      home: const BaseScafold(),
    );
  }
}
