import 'package:flutter/material.dart';

import '../../../design/components/scaffold.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final f = Theme.of(context).textTheme;


    return AppScaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
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
            )
          ],
        ),
      ),
    );
  }
}
