import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../design/components/scaffold.dart';
import '../../../shared/widgets/chip_items.dart';
import '../../../shared/models/chip_item.dart';
import '../widgets/card_capo.dart';

import '../../../design/tokens/spacing.dart';
import '../../../design/tokens/radius.dart';
import '../../../design/tokens/shadows.dart';


class Garment {
  final String nome;
  final String foto;
  final String tag;

  Garment({
    required this.nome,
    this.foto = 'https://groovemanmusic.com/cdn/shop/files/SpongeBob_Drip.png?v=1762461736&width=883',
    required this.tag,
  });
}


class ArmadioPage extends StatelessWidget {
  const ArmadioPage({super.key});

    static final garments = [
    Garment(nome: 'Felpa Amiri', tag: 'hoodie'),
    Garment(nome: 'Cappello NY', tag: 'cap'),
    Garment(nome: 'Guanti Nike', tag: 'gloves'),
    Garment(nome: 'Felpa nera', tag: 'hoodie'),
    Garment(nome: 'Scarpe Mcqueen', tag: 'shoes'),
    Garment(nome: 'Ciccio',  tag: 'luigi'),
  ];

  @override
  Widget build(BuildContext context) {
    final f = Theme.of(context).textTheme;
    final c = Theme.of(context).colorScheme;

    return AppScaffold(
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.xl),
        child: Column(
          spacing: AppSpacing.xl,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,  
              children: [   
                Text(
                  'Il mio armadio',
                  style: f.headlineLarge,
                ),
                Text(
                   'Tutti i tuoi capi',
                   style: f.bodyLarge,
                )
              ],
            ),
            Row(
              spacing: AppSpacing.md,
              children: [
                Expanded(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: c.surfaceContainer,
                      boxShadow: AppShadows.card(context),
                      borderRadius: BorderRadius.circular(AppRadius.full),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                            left: AppSpacing.xl, 
                            right: AppSpacing.xs
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/search.svg',
                            width: 25,
                            height: 25,
                            colorFilter: ColorFilter.mode(c.onSecondary, BlendMode.srcIn),
                          ),
                        ),
                        hintText: 'Cerca un capo ...',
                        hintStyle: f.bodyLarge,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppRadius.full),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: AppShadows.card(context),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.all(AppSpacing.md),
                    icon: SvgPicture.asset(
                      'assets/icons/favorite.svg',
                      width: 30,
                      height: 30,
                      colorFilter: ColorFilter.mode(c.onSecondary, BlendMode.srcIn),
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: c.surface,
                      side: BorderSide(color: c.outline),
                    ),
                    onPressed: () => print("filtro preferiti"), 
                  ),
                ),
              ],
            ),
            ChipItems(
              active: 'Magliette', 
              handleClick: (category) => print('Cliccato: $category'),
              filters: [ 
                 ChipItem(
                  label: 'Tutti',
                  icon: 'assets/icons/apps.svg',
                ),
                ChipItem(
                  label: 'Magliette',
                  icon: 'assets/icons/tshirt.svg',
                ),
                ChipItem(
                  label: 'Pantaloni',
                  icon: 'assets/icons/pants.svg',
                ),  
                ChipItem(
                  label: 'Giacche',
                  icon: 'assets/icons/jacket.svg',
                ),  
                ChipItem(
                  label: 'Scarpe',
                  icon: 'assets/icons/sneaker.svg',
                ),
              ],
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  overscroll: false,
                ),
                child: GridView.builder(
                  clipBehavior: Clip.hardEdge,
                  physics: const ClampingScrollPhysics(),
                  itemCount: garments.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: AppSpacing.md,
                    mainAxisSpacing: AppSpacing.md,
                    mainAxisExtent: 285, //
                  ),
                  itemBuilder: (context, i) {
                    final garment = garments[i];
                    return CardCapo(
                      name: garment.nome, 
                      tagName: garment.tag,
                      tagIcon: 'assets/icons/tshirt.svg',
                      isFavorite: false,
                      toggleFav: () => ('addFavorite()'),
                      image: 'https://groovemanmusic.com/cdn/shop/files/SpongeBob_Drip.png?v=1762461736&width=883', 
                      handleClick: () => print('Messaggio'),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
