import 'package:flutter/material.dart';

import '../../../design/components/scaffold.dart';
import '../../../shared/widgets/back_navigator.dart';
import '../widgets/garment_picker.dart';
import '../../../shared/widgets/input.dart';
import '../../../shared/widgets/chip_items.dart';
import '../../../shared/models/chip_item.dart';
import '../../../shared/widgets/chip_colors.dart';
import '../../../shared/models/chip_color.dart';

import '../../../design/tokens/typography.dart';
import '../../../design/tokens/spacing.dart';


class CapoPage extends StatelessWidget {
  const CapoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          overscroll: false,
          scrollbars: false,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.xl),
            child: Column(
              spacing: AppSpacing.xxl,
              children: [
                BackNavigator(
                  icon: 'assets/icons/close.svg', 
                  text: 'Nuovo Capo',
                ),
                GarmentPicker(),
                InputField(
                  label: 'Nome del capo',
                  hint: 'Es. Felpa con cappuccio',
                  icon: 'assets/icons/edit.svg',
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: AppSpacing.sm,
                  children: [
                    Text(
                      'CATEGORIA',
                      style: AppTypography.bodyBoldUppercase,
                    ),
                    ChipItems(
                      scrollable: false,
                      active: 'Maglietta', 
                      handleClick: (category) => print('Cliccato: $category'),
                      filters: [ 
                        ChipItem(
                          label: 'Maglietta',
                          icon: 'assets/icons/tshirt.svg',
                        ),
                        ChipItem(
                          label: 'Pantaloni',
                          icon: 'assets/icons/pants.svg',
                        ),  
                        ChipItem(
                          label: 'Giacca',
                          icon: 'assets/icons/jacket.svg',
                        ),  
                        ChipItem(
                          label: 'Scarpe',
                          icon: 'assets/icons/sneaker.svg',
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: AppSpacing.sm,
                  children: [
                    Text(
                      'COLORE',
                      style: AppTypography.bodyBoldUppercase,
                    ),
                    ChipColors(
                      scrollable: false,
                      active: 'Nero',
                      handleClick: (color) => print('Cliccato: $color'),
                      colors: [ 
                        ChipColor(
                          label: 'Nero',
                          color: Colors.black,
                        ),
                        ChipColor(
                          label: 'Bianco',
                          color: Colors.white,
                        ),
                        ChipColor(
                          label: 'Grigio',
                          color: Colors.grey,
                        ),
                        ChipColor(
                          label: 'Brown',
                          color: Colors.brown,
                        ),
                        ChipColor(
                          label: 'Blu',
                          color: Colors.blue,
                        ),
                        ChipColor(
                          label: 'Verde',
                          color: Colors.green,
                        ),
                        ChipColor(
                          label: 'Rosso',
                          color: Colors.red,
                        ),
                        ChipColor(
                          label: 'Giallo',
                          color: Colors.yellow,
                        ),
                        ChipColor(
                          label: 'Viola',
                          color: Colors.purple,
                        ),
                      ], 
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: AppSpacing.sm,
                  children: [
                    Text(
                      'STILE',
                      style: AppTypography.bodyBoldUppercase,
                    ),
                    ChipItems(
                      scrollable: false,
                      active: 'Casual', 
                      handleClick: (category) => print('Cliccato: $category'),
                      filters: [ 
                        ChipItem(
                          label: 'Casual',
                          icon: 'assets/icons/tshirt.svg',
                        ),
                        ChipItem(
                          label: 'Elegante',
                          icon: 'assets/icons/briefcase.svg',
                        ),  
          
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: AppSpacing.sm,
                  children: [
                    Text(
                      'STAGIONI',
                      style: AppTypography.bodyBoldUppercase,
                    ),
                    ChipItems(
                      scrollable: false,
                      active: 'Primavera', 
                      handleClick: (category) => print('Cliccato: $category'),
                      filters: [ 
                        ChipItem(
                          label: 'Primavera',
                          icon: 'assets/icons/spring.svg',
                        ),
                        ChipItem(
                          label: 'Estate',
                          icon: 'assets/icons/wb-sunny.svg',
                        ),  
                        ChipItem(
                          label: 'Autunno',
                          icon: 'assets/icons/sunny.svg',
                        ),  
                        ChipItem(
                          label: 'Inverno',
                          icon: 'assets/icons/winter.svg',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
