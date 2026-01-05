import 'package:flutter/material.dart';
import 'starry_night_background.dart';
import 'chart_svg_display.dart';
import 'lunar_phase_display.dart';

class ReadingScreenLayout extends StatelessWidget {
  final Widget header;
  final Future<String>? svgFuture;
  final int? birthChartId;
  final int? synastryId;
  final int? transitId;
  final String? transitType;
  final Widget content;
  final PreferredSizeWidget? appBar;
  final String personAName;
  final String? personBName;
  final bool darkMode;

  const ReadingScreenLayout({
    super.key,
    required this.header,
    this.svgFuture,
    this.birthChartId,
    this.synastryId,
    this.transitId,
    this.transitType,
    required this.content,
    this.appBar,
    required this.personAName,
    this.personBName,
    required this.darkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: appBar != null,
      appBar: appBar,
      body: StarryNightBackground(
        showPlanet: true,
        subtle: true,
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // Header
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: header,
                ),
              ),

              // SVG Chart Display
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  child: ChartSvgDisplay(
                    svgFuture: svgFuture,
                    birthChartId: birthChartId,
                    synastryId: synastryId,
                    transitId: transitId,
                    transitType: transitType,
                    personAName: personAName,
                    personBName: personBName,
                    darkMode: darkMode,
                  ),
                ),
              ),

              // Lunar Phase Display (only for birth charts)
              if (birthChartId != null)
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.all(16.0),
                    child: LunarPhaseDisplay(
                      birthChartId: birthChartId!,
                    ),
                  ),
                ),

              // Content
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  child: content,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
