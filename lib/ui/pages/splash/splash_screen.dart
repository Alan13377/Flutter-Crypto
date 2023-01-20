import 'package:crypto_flutter/ui/pages/base_scaffold.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.network(
          'https://res.cloudinary.com/imagenes-api/image/upload/v1674244471/servidor_it0apm.gif'),
      title: const Text(
        "Flutter Crypto",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 179, 182, 7),
      showLoader: true,
      loadingText: const Text("Loading..."),
      navigator: const BaseScafold(),
      durationInSeconds: 5,
    );
  }
}
