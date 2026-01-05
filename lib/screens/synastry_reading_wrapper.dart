import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/synastry.dart';
import '../services/synastry_service.dart';
import '../widgets/starry_night_background.dart';
import '../l10n/app_localizations.dart';
import 'synastry_reading_screen.dart';

class SynastryReadingWrapper extends StatefulWidget {
  final int synastryId;
  final bool chartOnly;

  const SynastryReadingWrapper({
    super.key,
    required this.synastryId,
    this.chartOnly = false,
  });

  @override
  State<SynastryReadingWrapper> createState() => _SynastryReadingWrapperState();
}

class _SynastryReadingWrapperState extends State<SynastryReadingWrapper> {
  late final SynastryService _service;
  Synastry? _synastry;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _service = SynastryService(context: context);
    _loadSynastry();
  }

  @override
  void dispose() {
    _service.dispose();
    super.dispose();
  }

  Future<void> _loadSynastry() async {
    try {
      final synastry = await _service.getSynastry(widget.synastryId);
      if (mounted) {
        setState(() {
          _synastry = synastry;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (_isLoading) {
      return Scaffold(
        body: StarryNightBackground(
          showPlanet: false,
          subtle: true,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    if (_error != null || _synastry == null) {
      return Scaffold(
        body: StarryNightBackground(
          showPlanet: false,
          subtle: true,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Colors.red,
                ),
                const SizedBox(height: 16),
                Text(
                  _error ?? l10n.synastryNotFound,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => context.go('/'),
                  child: Text(l10n.goToHome),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SynastryReadingScreen(
      synastry: _synastry!,
      chartOnly: widget.chartOnly,
    );
  }
}