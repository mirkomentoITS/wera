import 'package:flutter/material.dart';

import '../../../design/components/scaffold.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(
        child: Text(
          'Benvenuto',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
