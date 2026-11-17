import 'package:flutter/material.dart';

import '../../design/tokens/gradients.dart';
import '../../design/tokens/shadows.dart';
import '../../design/tokens/spacing.dart';
import '../../design/tokens/radius.dart';


enum AppButtonStyle {
  filled,
  tonal,
  outlined,
  text,
}


class AppButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final AppButtonStyle style;
  final VoidCallback? handleClick;

  const AppButton({
    super.key,
    required this.text,
    this.icon,
    required this.handleClick,
    this.style = AppButtonStyle.filled,
  });

  @override
  Widget build(BuildContext context) {
    final f = Theme.of(context).textTheme;
    final c = Theme.of(context).colorScheme;

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
          onTap: handleClick,
          borderRadius: radius,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xxl,
              vertical: AppSpacing.md,
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
