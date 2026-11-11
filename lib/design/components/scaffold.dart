import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../tokens/colors.dart';
import '../tokens/gradients.dart';


class AppScaffold extends StatelessWidget {

  final Widget body;
  final bool decoration;

  const AppScaffold({
    super.key,
    required this.body,
    this.decoration = true,
  });

  @override
  Widget build(BuildContext context) {

    final isDark = 
      Theme.of(context).brightness == Brightness.dark;

    final gradient = 
      isDark ? 
        AppGradients.darkBackground : 
        AppGradients.lightBackground;

    final blobColor = 
      isDark ?
        DarkColors.blob :
        LightColors.blob;

    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(decoration: BoxDecoration(gradient: gradient)),
        if (decoration) ...[
          Positioned(
            top: -30,
            right: -20,
            child: IgnorePointer(
              child: SvgPicture.asset(
                'assets/blobs/top.svg',
                width: 280,
                height: 220,
                colorFilter: ColorFilter.mode(blobColor, BlendMode.srcIn),
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            left: -90,
            child: IgnorePointer(
              child: SvgPicture.asset(
                'assets/blobs/bottom.svg',
                width: 280,
                height: 220,
                colorFilter: ColorFilter.mode(blobColor, BlendMode.srcIn),
              ),
            ),
          ),
        ],
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(child: body),
        ),
      ],
    );
  }
}