import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/cavern_details.dart';
import '../services/cavern_details_service.dart';
import '../constants/text_styles.dart';
import '../l10n/app_localizations.dart';

class CavernList extends StatelessWidget {
  const CavernList({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cavernDetails = CavernDetailsService.getAllCavernDetails(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            l10n.bookOfCaverns,
            style: AppTextStyles.getH4Style(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            l10n.bookOfCavernsDescription,
            style: AppTextStyles.getBodyStyle(context),
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(12, (index) {
          final houseNumber = index + 1;
          final cavern = cavernDetails.firstWhere(
            (c) => c.houseNumber == houseNumber,
            orElse: () => CavernDetails(
              houseNumber: houseNumber,
              title: l10n.cavernComingSoon(houseNumber),
              introduction: '',
              literalMeaning: '',
              esotericMeaning: '',
              imagePath: '',
            ),
          );

          final isAvailable = cavern.literalMeaning.isNotEmpty;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: isAvailable
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: Text(
                    houseNumber.toString(),
                    style: TextStyle(
                      color: isAvailable
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  cavern.title,
                  style: AppTextStyles.getBodyLargeStyle(context),
                ),
                subtitle: isAvailable
                    ? Text(
                        l10n.tapToExploreCavern,
                        style: AppTextStyles.getCaptionStyle(context),
                      )
                    : Text(
                        l10n.contentComingSoon,
                        style: AppTextStyles.getCaptionStyle(context).copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                trailing: isAvailable
                    ? Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : Icon(
                        Icons.lock_outline,
                        size: 16,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                enabled: isAvailable,
                onTap: isAvailable
                    ? () => context.push('/codex/cavern/$houseNumber')
                    : null,
              ),
              if (index < 11) const Divider(height: 1),
            ],
          );
        }),
      ],
    );
  }
}