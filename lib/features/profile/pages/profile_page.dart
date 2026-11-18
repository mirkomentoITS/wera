import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wera/shared/widgets/heading.dart';

import '../../../design/components/scaffold.dart';
import '../../../shared/widgets/button.dart';

import '../../../design/tokens/colors.dart';
import '../../../design/tokens/gradients.dart';
import '../../../design/tokens/spacing.dart';
import '../../../design/tokens/radius.dart';
import '../../../design/tokens/shadows.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                              child: CircleAvatar(
                                radius: 55,
                                backgroundColor: c.surfaceContainer,
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
              height: 100,
              decoration: BoxDecoration(
                color: c.surface,
                borderRadius: BorderRadius.circular(AppRadius.xxl),
                boxShadow: AppShadows.card(context),
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: AppSpacing.md,
                      horizontal: AppSpacing.xl,
                    ),
                    leading: SvgPicture.asset(
                      'assets/icons/checkroom.svg',
                      colorFilter: ColorFilter.mode(c.primary, BlendMode.srcIn),
                      width: 28,
                      height: 28,
                    ),
                    title: Row(
                      spacing: AppSpacing.lg,
                      children: [
                        SizedBox(
                          height: 32,
                          child: VerticalDivider(
                            thickness: 1,
                            color: c.outline,
                          ),
                        ),
                        Text(
                          'Stile preferito',
                          style: f.bodyMedium,
                        ),
                      ],
                    ),
                    onTap: () => print('click impostazione'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
