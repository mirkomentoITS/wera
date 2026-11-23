import 'package:flutter/material.dart';

import '../models/chip_color.dart';

import '../../design/tokens/spacing.dart';
import '../../design/tokens/radius.dart';


class ChipColors extends StatelessWidget {
  final List<ChipColor> colors;
  final String? active;
  final ValueChanged<String?> handleClick;
  final bool scrollable;

  const ChipColors({
    super.key,
    required this.colors,
    required this.active,
    required this.handleClick,
    this.scrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    final f = Theme.of(context).textTheme;
    final c = Theme.of(context).colorScheme;

    final chips = colors.map((item) {
      final isSelected = active == item.label;

      return FilterChip(
        avatar: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: item.color,
            shape: BoxShape.circle,
            border: Border.all(
              color: c.outline,
              width: 1,
            ),
          ),
        ),
        label: Text(
          item.label,
          style: f.labelMedium,
        ),
        selected: isSelected,
        onSelected: (_) => handleClick(item.label),
        showCheckmark: false,
        padding: EdgeInsets.all(AppSpacing.md),
        backgroundColor: c.surface,
        selectedColor: c.secondary,
        side: BorderSide(
          color: isSelected ? c.primary : c.outline,
          width: isSelected ? 2 : 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
      );
    }).toList();

    if (!scrollable) {
      return Wrap(
        spacing: AppSpacing.md,
        runSpacing: AppSpacing.sm,
        children: chips,
      );
    }

    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        children: [
          Row(
            spacing: AppSpacing.md,
            children: chips,
          ),
        ],
      ),
    );
  }
}