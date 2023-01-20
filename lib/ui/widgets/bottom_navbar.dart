import 'package:crypto_flutter/providers/bottom_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(bottomNavProvider);
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: BottomNavigationBar(
        iconSize: 18,
        type: BottomNavigationBarType.fixed,
        currentIndex: items.currentIndex,
        items: items.items,
        onTap: (index) {
          items.setCurrentIndex(index);
        },
      ),
    );
  }
}
