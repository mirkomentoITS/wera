import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/chip_item.dart';

import '../../design/tokens/colors.dart';
import '../../design/tokens/spacing.dart';
import '../../design/tokens/radius.dart';


class ChipList extends StatelessWidget {
  final List<ChipItem> filters;
  final String? active;
  final ValueChanged<String?> handleClick;
  final bool scrollable;

  const ChipList({
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

    final chips = filters.map((item) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
        child: FilterChip(
          avatar: SvgPicture.asset(
            item.icon,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(c.primary, BlendMode.srcIn),
          ),
          label: Text(
            item.label,
            style: f.labelMedium,
          ),
          selected: active == item.label,
          onSelected: (_) => handleClick(item.label),
          showCheckmark: false,
          padding: EdgeInsets.all(AppSpacing.md),
          backgroundColor: LightColors.lilac,
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