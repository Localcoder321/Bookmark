import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Duration duration;
  final Widget navigateAfterDuration;

  const SplashScreen({
    super.key,
    required this.duration,
    required this.navigateAfterDuration,
  });

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => widget.navigateAfterDuration),
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: const Color(0xff3d4eed),
            child: const Center(
              child: Image(
                image: AssetImage("assets/images/logo2.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

