import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/text_styles.dart';
import '../l10n/app_localizations.dart';
import '../widgets/starry_night_background.dart';

class ReleaseNotesScreen extends StatelessWidget {
  const ReleaseNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final releases = [
      _ReleaseInfo('4.5.1', l10n.releaseNotes_4_5_1),
      _ReleaseInfo('4.0.1', l10n.releaseNotes_4_0_1),
      _ReleaseInfo('4.0.0', l10n.releaseNotes_4_0_0),
      _ReleaseInfo('3.0.0', l10n.releaseNotes_3_0_0),
      _ReleaseInfo('2.4.0', l10n.releaseNotes_2_4_0),
      _ReleaseInfo('2.3.0', l10n.releaseNotes_2_3_0),
      _ReleaseInfo('2.2.1', l10n.releaseNotes_2_2_1),
      _ReleaseInfo('2.2.0', l10n.releaseNotes_2_2_0),
      _ReleaseInfo('2.1.0', l10n.releaseNotes_2_1_0),
      _ReleaseInfo('2.0.4', l10n.releaseNotes_2_0_4),
      _ReleaseInfo('2.0.3', l10n.releaseNotes_2_0_3),
      _ReleaseInfo('2.0.2', l10n.releaseNotes_2_0_2),
      _ReleaseInfo('2.0.1', l10n.releaseNotes_2_0_1),
    ];

    return Scaffold(
      body: StarryNightBackground(
        showPlanet: false,
        subtle: true,
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (GoRouter.of(context).canPop()) {
                      context.pop();
                    } else {
                      context.go('/settings');
                    }
                  },
                ),
                title: Text(
                  l10n.releaseNotesTitle,
                  style: AppTextStyles.getH4Style(context),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: releases.length,
                  itemBuilder: (context, index) {
                    final release = releases[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      color: Theme.of(context).colorScheme.surface,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.version(release.version),
                              style: AppTextStyles.getH5Style(context).copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              release.description,
                              style: AppTextStyles.getBodyStyle(context),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReleaseInfo {
  final String version;
  final String description;

  _ReleaseInfo(this.version, this.description);
}
