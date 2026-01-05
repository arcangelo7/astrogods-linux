import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/text_styles.dart';
import '../l10n/app_localizations.dart';

class UpdateRequiredScreen extends StatelessWidget {
  final String message;

  const UpdateRequiredScreen({
    super.key,
    required this.message,
  });

  String _getStoreUrl() {
    if (kIsWeb) {
      return 'https://astrogods.it';
    }
    if (Platform.isAndroid) {
      return 'https://play.google.com/store/apps/details?id=com.astrogods.app';
    }
    if (Platform.isIOS) {
      return 'https://apps.apple.com/app/astrogods';
    }
    return 'https://astrogods.it';
  }

  Future<void> _openStore() async {
    final url = Uri.parse(_getStoreUrl());
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.system_update,
                    size: 96,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    l10n.updateRequired,
                    style: AppTextStyles.getH2Style(context),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    message,
                    style: AppTextStyles.getBodyStyle(context),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _openStore,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(l10n.updateNow),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
