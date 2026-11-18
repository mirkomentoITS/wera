import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../design/tokens/spacing.dart';


class Heading extends StatelessWidget {
  final String text;
  final bool showButton;
  final VoidCallback? handleClick;

  const Heading({
    super.key,
    required this.text,
    required this.showButton,
    this.handleClick,
  });

  @override
  Widget build(BuildContext context) {
    final f = Theme.of(context).textTheme;
    final c = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: f.headlineSmall,
        ),
        if (showButton)
          TextButton(
            onPressed: handleClick,
            child: Row(
              spacing: AppSpacing.sm,
              children: [
                Text(
                  'Vedi Tutti',
                  style: f.labelMedium?.copyWith(
                    color: c.primary,
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/arrow-forward.svg',
                  height: 20,
                  width: 20,
                  colorFilter: ColorFilter.mode(
                    c.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
