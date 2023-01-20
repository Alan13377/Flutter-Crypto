import 'package:crypto_flutter/providers/bottom_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/bottom_navbar.dart';

class BaseScafold extends ConsumerWidget {
  const BaseScafold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationProvider = ref.watch(bottomNavProvider);
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 20,
          colors: [
            Color(0XFF0B092E),
            Colors.white,
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Good Morning",
                      style: GoogleFonts.montserrat(
                          fontSize: 15, fontWeight: FontWeight.w300)),
                  const Text(
                    "Rabah",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i.picsum.photos/id/43/200/300.jpg?hmac=F_cVhLISpNmZ9wjirHfMJgX9rQzMYJbJE1xzfwmV36c")),
            ],
          ),
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: navigationProvider.navigateTo()),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
