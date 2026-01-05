import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/birth_chart.dart';
import '../services/transit_service.dart' as transit;
import '../widgets/starry_night_background.dart';
import 'transit_reading_screen.dart';

class TransitReadingWrapper extends StatefulWidget {
  final int readingId;
  final String transitType; // 'daily' or 'monthly'
  final bool chartOnly;

  const TransitReadingWrapper({
    super.key,
    required this.readingId,
    required this.transitType,
    this.chartOnly = false,
  });

  @override
  State<TransitReadingWrapper> createState() => _TransitReadingWrapperState();
}

class _TransitReadingWrapperState extends State<TransitReadingWrapper> {
  late final transit.TransitService _service;
  Map<String, dynamic>? _transitData;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _service = transit.TransitService(context: context);
    _loadTransitReading();
  }

  @override
  void dispose() {
    _service.dispose();
    super.dispose();
  }

  Future<void> _loadTransitReading() async {
    try {
      Map<String, dynamic> data;

      if (widget.transitType == 'daily') {
        data = await _service.getDailyTransitReading(widget.readingId);
      } else {
        data = await _service.getMonthlyTransitReading(widget.readingId);
      }

      if (mounted) {
        setState(() {
          _transitData = data;
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

    if (_error != null || _transitData == null) {
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
                  _error ?? 'Error loading transit reading',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => context.go('/predictions'),
                  child: Text('Go to Predictions'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Extract birth chart data
    final birthChartData = _transitData!['birth_chart'] as Map<String, dynamic>?;
    if (birthChartData == null) {
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
                  'Error loading birth chart',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => context.go('/predictions'),
                  child: Text('Go to Predictions'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final birthChart = BirthChart.fromJson(birthChartData);
    final location = _transitData!['location'] as Map<String, dynamic>;

    if (widget.transitType == 'daily') {
      final dateStr = _transitData!['date'] as String;
      final date = DateTime.parse(dateStr);

      return TransitReadingScreen(
        birthChart: birthChart,
        transitType: widget.transitType,
        date: date,
        location: location,
        existingReading: _transitData!['reading'] as String?,
        readingId: widget.readingId,
        chartOnly: widget.chartOnly,
      );
    } else {
      final year = _transitData!['year'] as int;
      final month = _transitData!['month'] as int;

      return TransitReadingScreen(
        birthChart: birthChart,
        transitType: widget.transitType,
        year: year,
        month: month,
        location: location,
        existingReading: _transitData!['reading'] as String?,
        readingId: widget.readingId,
        chartOnly: widget.chartOnly,
      );
    }
  }
}