import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:wera/design/tokens/shadows.dart';

import '../../../design/tokens/spacing.dart';
import '../../../design/tokens/radius.dart';
import '../../../design/tokens/gradients.dart';

// photo upload --> garment picker
// items slot --> garment slot


class GarmentPicker extends StatefulWidget {    
  const GarmentPicker({super.key});             

  @override
  State<GarmentPicker> createState() =>
      _GarmentPickerState();
}


class _GarmentPickerState extends State<GarmentPicker> {

  File? image;
  final picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? picked = await picker.pickImage(
      source: source,
    );

    if (picked != null && mounted) {
      setState(() {
        image = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final f = Theme.of(context).textTheme;
    final c = Theme.of(context).colorScheme;

    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: Radius.circular(AppRadius.xxl),
        color: c.outlineVariant,
        strokeWidth: 2,
        dashPattern: [8, 6],
      ),
      child: Container(
        padding: EdgeInsets.all(AppSpacing.xxl) ,
        width: double.infinity,
        decoration: BoxDecoration(
          color: c.surfaceContainer,
          borderRadius: BorderRadius.circular(AppRadius.xl)
        ),
        child: image != null ? 
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: AppSpacing.lg,
              children: [
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    color: c.surface,
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                    boxShadow: AppShadows.card(context),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                    child: Image.file(
                      image!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                FilledButton.tonal(
                  onPressed: () => pickImage(ImageSource.gallery),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: AppSpacing.sm,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/add.svg',
                        colorFilter: ColorFilter.mode(c.primary, BlendMode.srcIn),
                      ),
                      Text(
                        'Cambia foto',
                        style: f.labelLarge?.copyWith(color: c.primary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSpacing.lg,
          children: [
            Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: AppGradients.brand(context),
                borderRadius: BorderRadius.circular(AppRadius.full),
                boxShadow: AppShadows.button(context),
              ),
              child: SvgPicture.asset(
                'assets/icons/photo-camera.svg',
                width: 35,
                height: 35,
                colorFilter: ColorFilter.mode(c.onPrimary, BlendMode.srcIn),
              ),
            ),
            Text(
              'Aggiungi una foto del capo',
              style: f.bodyMedium?.copyWith(
                color: c.onSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: AppSpacing.md,
              children: [
                FilledButton.tonal(
                  onPressed: () => pickImage(ImageSource.camera),
                  child: const Text('Fotocamera'),
                ),
                FilledButton.tonal(
                  onPressed: () => pickImage(ImageSource.gallery),
                  child: const Text('Galleria'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}