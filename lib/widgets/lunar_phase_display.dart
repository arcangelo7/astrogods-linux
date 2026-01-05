import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/text_styles.dart';
import '../l10n/app_localizations.dart';
import '../services/birth_chart_service.dart';
import '../services/reading_state_service.dart';

class LunarPhaseDisplay extends StatefulWidget {
  final int birthChartId;

  const LunarPhaseDisplay({
    super.key,
    required this.birthChartId,
  });

  @override
  State<LunarPhaseDisplay> createState() => _LunarPhaseDisplayState();
}

class _LunarPhaseDisplayState extends State<LunarPhaseDisplay> {
  int? _moonPhase;
  String? _moonPhaseName;
  String? _moonSvg;
  bool _isLoading = true;

  static const double _maxWidth = 700.0;

  @override
  void initState() {
    super.initState();
    _loadLunarPhase();
  }

  Future<void> _loadLunarPhase() async {
    final service = BirthChartService(context: context);
    final data = await service.getLunarPhase(widget.birthChartId);
    ReadingStateService().cacheLunarPhase(widget.birthChartId, data);
    if (mounted) {
      setState(() {
        _moonPhase = data['moon_phase'] as int;
        _moonPhaseName = data['moon_phase_name'] as String;
        _moonSvg = data['moon_svg'] as String;
        _isLoading = false;
      });
    }
  }

  String _getLocalizedPhaseName(BuildContext context, String backendPhaseName) {
    final l10n = AppLocalizations.of(context)!;
    switch (backendPhaseName) {
      case 'New':
        return l10n.newMoon;
      case 'Waxing crescent':
        return l10n.waxingCrescent;
      case 'First quarter':
        return l10n.firstQuarter;
      case 'Waxing gibbous':
        return l10n.waxingGibbous;
      case 'Full':
        return l10n.fullMoon;
      case 'Waning gibbous':
        return l10n.waningGibbous;
      case 'Last quarter':
        return l10n.lastQuarter;
      case 'Waning crescent':
        return l10n.waningCrescent;
      default:
        return backendPhaseName;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth > _maxWidth ? _maxWidth : screenWidth;

    return Center(
      child: Container(
        width: containerWidth,
        padding: const EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: _isLoading
            ? const SizedBox(
                width: 60,
                height: 60,
                child: Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.string(
                    _moonSvg!,
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _getLocalizedPhaseName(context, _moonPhaseName!),
                    style: AppTextStyles.getBodyStyle(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.dayCount(_moonPhase!),
                    style: AppTextStyles.getBodyStyle(context).copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
      ),
    );
  }
}
