import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../design/tokens/spacing.dart';
import '../../design/tokens/shadows.dart';


class BackNavigator extends StatelessWidget {
  final String icon;  
  final String text;

  const BackNavigator({
    super.key,
    required this.icon,    
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final f = Theme.of(context).textTheme;
    final c = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: AppSpacing.md,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: AppShadows.card(context),
          ),
          child: IconButton(
            icon: SvgPicture.asset(
              icon,
              width: 20,
              height: 20,
            ),
            style: IconButton.styleFrom(
              backgroundColor: c.surface,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),        
        Text(
          text,
          style: f.headlineSmall,
        ),
      ],
    );
  }
}