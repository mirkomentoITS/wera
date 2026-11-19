import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../design/theme/theme.dart';
import '../design/theme/theme_controller.dart';

import '../features/armadio/pages/armadio_page.dart';
import '../features/profile/pages/profile_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.themeMode,
      themeAnimationDuration: Duration.zero,
      home: const ProfilePage(),
    );
  }
}
