import 'package:flutter/material.dart';

import '../tokens/gradients.dart';
import '../tokens/radius.dart';
import '../tokens/shadows.dart';


enum AppButtonStyle {
  filled,
  tonal,
  outlined,
  text,
}


class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonStyle style;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.style = AppButtonStyle.filled,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final f = Theme.of(context).textTheme;
    final c = Theme.of(context).colorScheme;

    // BUTTON STYLE
    Color? backgroundColor;
    Gradient? gradient;
    Border? border;
    List<BoxShadow>? shadow;
    late Color foregroundColor;

    switch (style) {
      case AppButtonStyle.filled:
        gradient = AppGradients.brand(context);
        shadow = AppShadows.button(context);
        foregroundColor = c.onPrimary;

      case AppButtonStyle.tonal:
        backgroundColor = c.secondary;
        foregroundColor = c.onSecondary;

      case AppButtonStyle.outlined:
        border = Border.all(
          color: c.primary,
          width: 2,
        );
        foregroundColor = c.primary;

      case AppButtonStyle.text:
        foregroundColor = c.primary;
    }

    final radius =
        BorderRadius.circular(AppRadius.full);

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        gradient: gradient,
        border: border,
        borderRadius: radius,
        boxShadow: shadow,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: radius,
        child: InkWell(
          onTap: onPressed,
          borderRadius: radius,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 14,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(
                    icon,
                    size: 24,
                    color: foregroundColor,
                  ),
                  const SizedBox(width: 10),
                ],
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: f.labelLarge?.copyWith(
                    color: foregroundColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
