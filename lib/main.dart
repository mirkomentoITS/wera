import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'design/theme/theme_controller.dart';

import 'app/app.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeController(),
      child: const MyApp(),
    ),
  );
}