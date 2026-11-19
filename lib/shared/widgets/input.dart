import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../design/tokens/spacing.dart';
import '../../../design/tokens/radius.dart';
import '../../../design/tokens/shadows.dart';


class InputField extends StatelessWidget {
  final String icon;
  final String label;
  final String? hint;
  final TextEditingController? controller;

  const InputField({
    super.key,
    required this.icon,
    required this.label,
    this.hint,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final f = Theme.of(context).textTheme;
    final c = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        boxShadow: AppShadows.card(context),
        border: Border.all(
          color: c.outline,
          width: 1.5,
        ),
      ),
      child: Row(
        spacing: AppSpacing.md,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 22,
            height: 22,
            colorFilter: ColorFilter.mode(
              c.onSurfaceVariant,
              BlendMode.srcIn,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: f.labelSmall?.copyWith(
                    color: c.onSurfaceVariant,
                  ),
                ),
                TextFormField(
                  controller: controller,
                  style: f.bodyMedium?.copyWith(
                    color: c.onSurface,
                  ),
                  decoration: InputDecoration(
                    hintText: hint,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}