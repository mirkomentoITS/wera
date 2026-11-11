import 'dart:async';
import 'package:flutter/material.dart';

import '../../../design/tokens/colors.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State createState() => _ClockState();
}


class _ClockState extends State<SplashPage> {

  Timer? timer;
  int secondi = 0;

  @override
  void initState() {
    super.initState();

    timer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.3, -0.2),
            end: Alignment(1.3, 0.2),
            colors: [
              LightColors.brandStart,
              LightColors.brandEnd,
            ],
            stops: [0.0, 1.0],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 15,
            children: [
              Image.asset(
                'assets/logos/logo.png',
                width: 200,
                height: 200,
              ),
              SizedBox(
                width: 120,
                child: LinearProgressIndicator(
                  minHeight: 5,
                  backgroundColor: LightColors.borderDefault,
                  color: LightColors.textPrimary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
