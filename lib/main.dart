import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        duration: Duration(seconds: 3),
        navigateAfterDuration:
            HomeScreen(),
      ),
    );
  }
}






