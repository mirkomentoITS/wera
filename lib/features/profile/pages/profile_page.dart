import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../design/theme/theme_controller.dart';

import '../../../design/components/scaffold.dart';
import '../../../shared/widgets/heading.dart';
import '../widgets/setting_tile.dart';

import '../../../design/tokens/colors.dart';
import '../../../design/tokens/gradients.dart';
import '../../../design/tokens/spacing.dart';
import '../../../design/tokens/radius.dart';
import '../../../design/tokens/shadows.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  
  static final List<Color> favoriteColors = [
    Colors.orange,
    Colors.red,
    Colors.black,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    final f = Theme.of(context).textTheme;
    final c = Theme.of(context).colorScheme;
    final themeController = context.watch<ThemeController>();

    final isDark = 
      Theme.of(context).brightness == Brightness.dark;

    final blobColor = 
      isDark ?
        DarkColors.blob :
        LightColors.blob;

    return AppScaffold(
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.xl),
        child: Column(
          spacing: AppSpacing.lg,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,  
              children: [   
                Text(
                  'Il mio profilo',
                  style: f.headlineLarge,
                ),
                Text(
                   'Le tue informazioni e impostazioni',
                   style: f.bodyLarge,
                ),
              ],
            ),
            Container(
              height: 170,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                gradient: AppGradients.hero(context),
                borderRadius: BorderRadius.circular(AppRadius.xxxl),
                boxShadow: AppShadows.card(context),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: -10,
                    left: 0,
                    child: SvgPicture.asset(
                      'assets/blobs/card.svg',
                       colorFilter: ColorFilter.mode(blobColor, BlendMode.srcIn),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(AppSpacing.xxl),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: AppSpacing.xl, 
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppRadius.full),
                                border: Border.all(
                                  color: c.surface,
                                  width: 5,
                                ),
                              ),
                              child: Container(
                                width: 110,
                                height: 110,
                                decoration: BoxDecoration(
                                  color: c.surfaceContainer,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.person_outline,
                                  size: 45,
                                  color: c.primary,
                                )  
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  gradient: AppGradients.brand(context),
                                  borderRadius: BorderRadius.circular(AppRadius.full),
                                  border: Border.all(
                                    color: c.surface,
                                    width: 3,
                                  ),
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.all(6),
                                  icon: SvgPicture.asset(
                                    'assets/icons/photo-camera.svg',
                                    width: 205,
                                    height: 205,
                                    colorFilter: ColorFilter.mode(c.onPrimary, BlendMode.srcIn),
                                  ),                                  
                                  onPressed: () => print('cambia foto'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,  
                          children: [
                            Text(
                              'Utente Uno',
                              style: f.headlineMedium,
                            ),
                            Text(
                              'utente@email.it',
                              style: f.bodyLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Heading(
              text: 'Le mie preferenze',
              showButton: false,
            ),
            Container(
              decoration: BoxDecoration(
                color: c.surface,
                borderRadius: BorderRadius.circular(AppRadius.xxl),
                boxShadow: AppShadows.card(context),
              ),
              child: Column(
                children: [
                  SettingTile(
                    icon: 'assets/icons/checkroom.svg', 
                    text: 'Stile preferito',
                    trailing: Text(
                      'Casual, Minimal',
                      style: f.bodyMedium?.copyWith(color: c.onSecondary),
                    ),
                  ),
                  Divider(
                    height: 1,
                    indent: 25,
                    endIndent: 25,
                    color: c.outline,
                  ),
                  SettingTile(
                    icon: 'assets/icons/palette.svg', 
                    text: 'Colori Preferiti',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: AppSpacing.xs,
                      children: favoriteColors.map((color) {
                        return Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: c.outline,
                              width: 1,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),   
                ],
              ),
            ),
            Heading(
              text: 'Impostazioni',
              showButton: false,
            ),
            Container(
              decoration: BoxDecoration(
                color: c.surface,
                borderRadius: BorderRadius.circular(AppRadius.xxl),
                boxShadow: AppShadows.card(context),
              ),
              child: Column(
                children: [
                  SettingTile(
                    icon: 'assets/icons/moon.svg', 
                    text: 'Tema scuro',
                    trailing: Switch(
                      activeTrackColor: c.outline,
                      inactiveTrackColor: c.outline,
                      activeThumbColor: c.onPrimary,
                      inactiveThumbColor: c.onPrimary,
                      value: themeController.isDark,
                      onChanged: (value) {
                        themeController.toggleTheme();
                      },
                    ),
                  ),
                  Divider(
                    height: 1,
                    indent: 25,
                    endIndent: 25,
                    color: c.outline,
                  ),
                  SettingTile(
                    icon: 'assets/icons/info.svg', 
                    text: 'Informazioni sull app',
                    trailing: IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/chevron-right.svg',
                        width: 25,
                        height: 25,
                      ),
                      onPressed: () => print('cliccato'), 
                    ),
                  ),
                  Divider(
                    height: 1,
                    indent: 25,
                    endIndent: 25,
                    color: c.outline,
                  ),
                  SettingTile(
                    icon: 'assets/icons/door.svg', 
                    text: 'Esci dall account',
                    trailing: IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/chevron-right.svg',
                        width: 25,
                        height: 25,
                      ),
                      onPressed: () => print('cliccato'), 
                    ),
                  ),
                  Divider(
                    height: 1,
                    indent: 25,
                    endIndent: 25,
                    color: c.outline,
                  ),
                  SettingTile(
                    icon: 'assets/icons/trash.svg', 
                    text: 'Elimina account',
                    color: c.error,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
