import 'package:flutter/material.dart';

import '../../../design/components/scaffold.dart';
import '../../../design/tokens/radius.dart';
import '../../../design/tokens/gradients.dart';
import '../../../design/tokens/shadows.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final f = Theme.of(context).textTheme;

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
              padding: EdgeInsets.all(25),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: AppGradients.hero(context),
                borderRadius: BorderRadius.circular(AppRadius.xxl),
                boxShadow: AppShadows.card(context)
              ),
              child: Text(
                'Il look giusto per te',
                style: f.displaySmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}
