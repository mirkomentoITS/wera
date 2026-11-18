import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//import '../../../design/tokens/gradients.dart';
import '../../../design/tokens/shadows.dart';
import '../../../design/tokens/radius.dart';
import '../../../design/tokens/spacing.dart';


class CardCapo extends StatelessWidget {
  final String name;
  final String tagName;
  final String tagIcon;
  final String image;
  final VoidCallback? handleClick;
  final bool isFavorite;
  final VoidCallback? toggleFav;

  const CardCapo({
    super.key,
    required this.name,
    required this.tagName,
    required this.tagIcon,
    required this.image,                     // gestisce click sulla card
    required this.handleClick,               // non ancora usato
    required this.isFavorite,
    required this.toggleFav,
  });

  @override
  Widget build(BuildContext context) {
    final f = Theme.of(context).textTheme;
    final c = Theme.of(context).colorScheme;

    return Container(
      width: 180,
      height: 285,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: AppShadows.card(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [ 
              Image.network(
                image,
                width: double.infinity,
                height: 175,
                fit: BoxFit.cover,
              ),              
              Positioned(
                top: 5, 
                right: 5,
                child: IconButton(
                  icon: SvgPicture.asset(
                    isFavorite ? 'assets/icons/favorite_filled.svg'
                               : 'assets/icons/favorite.svg',
                    colorFilter: ColorFilter.mode(c.onSecondary, BlendMode.srcIn),
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: c.surface,
                  ),
                  onPressed: toggleFav, 
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start, 
              spacing: AppSpacing.sm,
              children: [
                Text(
                  name,
                  style: f.titleMedium,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6, horizontal: 14
                  ),
                  decoration: BoxDecoration(
                    color: c.outline,
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 6,
                    children: [
                      SvgPicture.asset(
                        tagIcon,
                        height: 18,
                        width: 18,
                        colorFilter: ColorFilter.mode(c.primary, BlendMode.srcIn),
                      ),
                      Text(
                        tagName,
                        style: f.labelMedium,
                      ),
                    ],
                  ), 
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
