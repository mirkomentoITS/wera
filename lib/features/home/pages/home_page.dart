import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../design/components/scaffold.dart';
import '../../../design/tokens/colors.dart';
import '../../../design/tokens/gradients.dart';
import '../../../design/tokens/radius.dart';
import '../../../design/tokens/shadows.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final f = Theme.of(context).textTheme;

    final isDark = 
      Theme.of(context).brightness == Brightness.dark;

    final blobColor = 
      isDark ?
        DarkColors.blob :
        LightColors.blob;

    return AppScaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 22,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,  
              children: [   
                Text(
                  'Ciao Utente',
                  style: f.headlineLarge,
                ),
                Text(
                   'Pronto per oggi?',
                   style: f.bodyLarge,
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 250,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                gradient: AppGradients.hero(context),
                borderRadius: BorderRadius.circular(AppRadius.xxl),
                boxShadow: AppShadows.card(context)
              ),
              child: Stack(  
                children: [
                  Positioned(
                    bottom: 0,
                    left: -10,
                    child: IgnorePointer(
                      child: SvgPicture.asset(
                        'assets/blobs/card.svg',
                        width: 450,
                        height: 110,
                        colorFilter: ColorFilter.mode(blobColor, BlendMode.srcIn),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 40, horizontal: 20
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Il look giusto per oggi',
                              style: f.displaySmall,
                            ),
                          ),
                        ),   
                        Image.asset(
                          'assets/images/outfit.png',
                          width: 170,
                          height: 190,
                        ),                      
                      ],
                    ),
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
