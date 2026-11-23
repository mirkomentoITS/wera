import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/chip_item.dart';

import '../../design/tokens/colors.dart';
import '../../design/tokens/spacing.dart';
import '../../design/tokens/radius.dart';
import '../../design/tokens/shadows.dart';


class ChipItems extends StatelessWidget {
  final List<ChipItem> filters;
  final String? active;
  final ValueChanged<String?> handleClick;
  final bool scrollable;

  const ChipItems({
    super.key,
    required this.filters,
    required this.active,
    required this.handleClick,
    this.scrollable = true,
  });
  

  @override
  Widget build(BuildContext context) {
    final f = Theme.of(context).textTheme;
    final c = Theme.of(context).colorScheme;

    final isDark = 
      Theme.of(context).brightness == Brightness.dark;

    final blobColor = 
      isDark ?
        DarkColors.blob :
        LightColors.blob;

    final chips = filters.map((item) {
      final isSelected = active == item.label;
      return Container(
        decoration: BoxDecoration(
          boxShadow: isSelected ? AppShadows.button(context) : null
        ),
        child: FilterChip(              // il filtro deve essere multiplo
          avatar: SvgPicture.asset(     // devo poter selezionare piu chip
            item.icon,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              isSelected ? c.onPrimary : c.primary, BlendMode.srcIn
            ),
          ),
          label: Text(
            item.label,
            style: f.labelMedium?.copyWith(
              color: isSelected ? c.onPrimary : c.primary
            ),
          ),
          selected: isSelected,
          onSelected: (_) => handleClick(item.label),
          showCheckmark: false,
          padding: EdgeInsets.all(AppSpacing.md),
          backgroundColor: isDark ? DarkColors.lilac : LightColors.lilac,
          selectedColor: c.primary,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.full),
          ),
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