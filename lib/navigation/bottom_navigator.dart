import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../design/tokens/spacing.dart';
import '../design/tokens/radius.dart';
import '../design/tokens/shadows.dart';


class BottomNavigator extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const BottomNavigator({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;

    Widget svg(String path, Color color) => SvgPicture.asset(
      path,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        boxShadow: AppShadows.nav(context),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: NavigationBar(
            height: 50,
            selectedIndex: selectedIndex,
            onDestinationSelected: onTap,
            backgroundColor: Colors.transparent,
            elevation: 0,
            indicatorColor: c.secondary,
            labelBehavior:  NavigationDestinationLabelBehavior.alwaysHide,
            destinations: [
              NavigationDestination(
                icon: svg('assets/icons/home.svg', c.onSurfaceVariant),
                selectedIcon: svg('assets/icons/home.svg', c.onSurface),
                label: 'Home',
              ),
              NavigationDestination(
                icon: svg('assets/icons/auto-awesome.svg', c.onSurfaceVariant),
                selectedIcon: svg('assets/icons/auto-awesome.svg', c.onSurface),
                label: 'Consiglio',
              ),
              NavigationDestination(
                icon: svg('assets/icons/checkroom.svg', c.onSurfaceVariant),
                selectedIcon: svg('assets/icons/checkroom.svg', c.onSurface),
                label: 'Outfit',
              ),
              NavigationDestination(
                icon: svg('assets/icons/wardrobe.svg', c.onSurfaceVariant),
                selectedIcon: svg('assets/icons/wardrobe.svg', c.onSurface),
                label: 'Armadio',
              ),
              NavigationDestination(
                icon: svg('assets/icons/person.svg', c.onSurfaceVariant),
                selectedIcon: svg('assets/icons/person.svg', c.onSurface),
                label: 'Profilo',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
