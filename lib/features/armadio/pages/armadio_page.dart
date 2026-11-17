import 'package:flutter/material.dart';

import '../../../design/components/scaffold.dart';
//import '../../../design/components/card_capo.dart';

//import '../../../design/tokens/colors.dart';
//import '../../../design/tokens/gradients.dart';
import '../../../design/tokens/radius.dart';
import '../../../design/tokens/shadows.dart';


class ArmadioPage extends StatelessWidget {
  const ArmadioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final f = Theme.of(context).textTheme;
    final c = Theme.of(context).colorScheme;

    final isDark = 
      Theme.of(context).brightness == Brightness.dark;

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
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: c.surfaceContainer,
                boxShadow: AppShadows.card(context),
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Cerca un capo ...',
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.full),
                  ),  
                ),
              ),
            ),
     /*      CardCapo(
              name: 'Felpa con cappuccio', 
              tagName: 'Maglietta',
              tagIcon: 'assets/icons/tshirt.svg',
              isFavorite: false,
              onToggleFav: () => ('addFavorite()'),
              image: 'https://groovemanmusic.com/cdn/shop/files/SpongeBob_Drip.png?v=1762461736&width=883', 
              onPressed: () => print('Messaggio'),
            )
     */       
          ],
        ),
      ),
    );
  }
}
