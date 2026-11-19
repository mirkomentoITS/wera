import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../design/tokens/spacing.dart';


class SettingTile extends StatelessWidget {
  final String icon;
  final String text;
  final Color? color;
  final Widget? trailing;

  const SettingTile({
    super.key,
    required this.icon,
    required this.text,
    this.color,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final f = Theme.of(context).textTheme;
    final c = Theme.of(context).colorScheme;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        vertical: AppSpacing.xs,
        horizontal: AppSpacing.xl,
      ),
      horizontalTitleGap: AppSpacing.lg,
      leading: SvgPicture.asset(
        icon,
        width: 28,
        height: 28,        
        colorFilter: ColorFilter.mode(
          color ?? c.primary,
          BlendMode.srcIn,
        ),
      ),
      title: Row(
        spacing: AppSpacing.lg,
        children: [
          SizedBox(
            height: 32,
            child: VerticalDivider(
              width: 1,
              thickness: 1,
              color: c.outline,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: f.bodyMedium?.copyWith(color: color),
            ),
          ),
        ],
      ),
      trailing: trailing,
    );
  }
}