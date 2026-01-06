import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:file_saver/file_saver.dart';
import '../config/image_urls.dart';
import '../models/birth_chart.dart';
import '../models/synastry.dart';
import '../models/transit.dart';
import '../models/reading.dart';
import '../l10n/app_localizations.dart';
import '../utils/date_utils.dart' as date_utils;
import '../constants/cavern_names.dart';
import 'reading_state_service.dart';

class PdfService {
  final BuildContext context;
  pw.ThemeData? _unicodeTheme;

  PdfService({required this.context});

  pw.SvgImage _createSvgImage(String svgString) {
    return pw.SvgImage(svg: svgString);
  }

  pw.ThemeData _getTheme() {
    _unicodeTheme ??= pw.ThemeData.withFont(
      base: pw.Font.helvetica(),
      bold: pw.Font.helveticaBold(),
      italic: pw.Font.helveticaOblique(),
      boldItalic: pw.Font.helveticaBoldOblique(),
    );
    return _unicodeTheme!;
  }

  final Map<String, Uint8List> _cavernImageCache = {};

  Future<pw.Widget?> _buildCavernImage(String houseNumber) async {
    if (!cavernPdfNames.containsKey(houseNumber)) {
      return null;
    }

    Uint8List imageBytes;
    if (_cavernImageCache.containsKey(houseNumber)) {
      imageBytes = _cavernImageCache[houseNumber]!;
    } else {
      final filename = cavernPdfNames[houseNumber]!;
      final url = ImageUrls.cavernPdf(filename);

      final fileInfo = await DefaultCacheManager().getFileFromCache(url);
      if (fileInfo == null) {
        throw StateError('Cavern image not found in cache for house $houseNumber');
      }
      imageBytes = await fileInfo.file.readAsBytes();
      _cavernImageCache[houseNumber] = imageBytes;
    }

    final image = pw.MemoryImage(imageBytes);
    return pw.Center(
      child: pw.Image(image, width: 500, height: 282),
    );
  }

  Future<Uint8List> _generatePdf({
    required String cacheKey,
    required int id,
    required String title,
    required pw.Widget infoBox,
    String? readingContent,
    bool chartOnly = false,
  }) async {
    final pdf = pw.Document();
    final l10n = AppLocalizations.of(context)!;
    final theme = _getTheme();
    final stateService = ReadingStateService();

    final cachedSvg = stateService.getCachedChartSvg(cacheKey, id);
    if (cachedSvg == null) {
      throw StateError('Chart SVG not found in cache for $cacheKey:$id');
    }
    final chartSvg = _createSvgImage(cachedSvg);

    final chartWidget = pw.Center(
      child: pw.Container(width: 450, height: 598, child: chartSvg),
    );

    // Always use light mode for PDF (white background needs black text)
    pw.Widget? detailsWidget;
    final detailsSvg = stateService.getCachedDetailsSvg(cacheKey, id, darkMode: false);
    if (detailsSvg != null) {
      detailsWidget = pw.Center(
        child: pw.Container(width: 450, height: 598, child: _createSvgImage(detailsSvg)),
      );
    }

    pw.Widget? aspectGridWidget;
    final aspectGridSvg = stateService.getCachedAspectGridSvg(cacheKey, id, darkMode: false);
    if (aspectGridSvg != null) {
      aspectGridWidget = pw.Center(
        child: pw.Container(width: 500, height: 400, child: _createSvgImage(aspectGridSvg)),
      );
    }

    List<pw.Widget> content;
    if (chartOnly) {
      content = [
        _buildPdfHeader(title),
        pw.SizedBox(height: 20),
        infoBox,
        pw.SizedBox(height: 20),
        chartWidget,
        if (detailsWidget != null) ...[
          pw.NewPage(),
          detailsWidget,
        ],
        if (aspectGridWidget != null) ...[
          pw.NewPage(),
          aspectGridWidget,
        ],
      ];
    } else {
      final readingWidgets = await _buildReadingContentWithImages(
        readingContent!,
        l10n,
      );
      content = [
        _buildPdfHeader(title),
        pw.SizedBox(height: 20),
        chartWidget,
        if (detailsWidget != null) ...[
          pw.NewPage(),
          detailsWidget,
        ],
        if (aspectGridWidget != null) ...[
          pw.NewPage(),
          aspectGridWidget,
        ],
        pw.NewPage(),
        infoBox,
        pw.SizedBox(height: 30),
        ...readingWidgets,
      ];
    }

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        theme: theme,
        margin: const pw.EdgeInsets.all(40),
        maxPages: chartOnly ? 10 : 100,
        build: (_) => content,
      ),
    );

    return await pdf.save();
  }

  Future<Uint8List> generateBirthChartPdf({
    required BirthChart birthChart,
    required Reading reading,
  }) {
    final l10n = AppLocalizations.of(context)!;
    final lunarData = ReadingStateService().getCachedLunarPhase(birthChart.id);
    if (lunarData == null) {
      throw StateError('Lunar phase data not found in cache for birth chart ${birthChart.id}');
    }

    return _generatePdf(
      cacheKey: 'birthChart',
      id: birthChart.id,
      title: l10n.birthChartOf(birthChart.fullName),
      infoBox: _buildBirthChartInfo(birthChart, l10n, lunarData),
      readingContent: reading.reading,
    );
  }

  Future<Uint8List> generateBirthChartChartOnlyPdf({
    required BirthChart birthChart,
  }) {
    final l10n = AppLocalizations.of(context)!;
    final lunarData = ReadingStateService().getCachedLunarPhase(birthChart.id);
    if (lunarData == null) {
      throw StateError('Lunar phase data not found in cache for birth chart ${birthChart.id}');
    }

    return _generatePdf(
      cacheKey: 'birthChart',
      id: birthChart.id,
      title: l10n.birthChartOf(birthChart.fullName),
      infoBox: _buildBirthChartInfo(birthChart, l10n, lunarData),
      chartOnly: true,
    );
  }

  Future<Uint8List> generateSynastryPdf({
    required Synastry synastry,
    required Reading reading,
  }) {
    final l10n = AppLocalizations.of(context)!;

    return _generatePdf(
      cacheKey: 'synastry',
      id: synastry.id,
      title: l10n.synastryBetween(
        synastry.birthChartA!.fullName,
        synastry.birthChartB!.fullName,
      ),
      infoBox: _buildSynastryInfo(synastry, l10n),
      readingContent: reading.reading,
    );
  }

  Future<Uint8List> generateSynastryChartOnlyPdf({
    required Synastry synastry,
  }) {
    final l10n = AppLocalizations.of(context)!;

    return _generatePdf(
      cacheKey: 'synastry',
      id: synastry.id,
      title: l10n.synastryBetween(
        synastry.birthChartA!.fullName,
        synastry.birthChartB!.fullName,
      ),
      infoBox: _buildSynastryInfo(synastry, l10n),
      chartOnly: true,
    );
  }

  pw.Widget _buildPdfHeader(String title) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.Text(
          'AstroGods',
          style: pw.TextStyle(
            color: PdfColors.black,
            fontSize: 24,
            fontWeight: pw.FontWeight.bold,
          ),
          textAlign: pw.TextAlign.center,
        ),
        pw.SizedBox(height: 8),
        pw.Text(
          title,
          style: pw.TextStyle(color: PdfColors.black, fontSize: 18),
          textAlign: pw.TextAlign.center,
        ),
        pw.SizedBox(height: 16),
        pw.Divider(),
      ],
    );
  }

  String _getLocalizedPhaseName(AppLocalizations l10n, String backendPhaseName) {
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

  pw.Widget _buildBirthChartInfo(
    BirthChart birthChart,
    AppLocalizations l10n,
    Map<String, dynamic> lunarPhaseData,
  ) {
    final translatedPhaseName = _getLocalizedPhaseName(
      l10n,
      lunarPhaseData['moon_phase_name'] as String,
    );

    final children = <pw.Widget>[
      pw.Text(
        birthChart.fullName,
        style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
      ),
      pw.SizedBox(height: 4),
      _buildInfoRow(
        l10n.dateOfBirth,
        date_utils.DateUtils.formatDate(context, birthChart.date),
      ),
      if (birthChart.place != null)
        _buildInfoRow(l10n.placeOfBirth, birthChart.place!),
      if (birthChart.unknownTime)
        _buildInfoRow(l10n.timeOfBirth, l10n.unknownTime),
      pw.SizedBox(height: 8),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.SvgImage(
            svg: lunarPhaseData['moon_svg'] as String,
            width: 40,
            height: 40,
          ),
          pw.SizedBox(width: 12),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                l10n.lunarPhase,
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                '$translatedPhaseName, ${l10n.dayNumber(lunarPhaseData['moon_phase'] as int)}',
              ),
            ],
          ),
        ],
      ),
    ];

    return _buildInfoBox(l10n.birthInformation, children);
  }

  pw.Widget _buildSynastryInfo(Synastry synastry, AppLocalizations l10n) {
    final children = <pw.Widget>[
      pw.Text(
        synastry.birthChartA!.fullName,
        style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
      ),
      pw.SizedBox(height: 4),
      _buildInfoRow(
        l10n.dateOfBirth,
        date_utils.DateUtils.formatDate(context, synastry.birthChartA!.date),
      ),
      if (synastry.birthChartA!.place != null)
        _buildInfoRow(l10n.placeOfBirth, synastry.birthChartA!.place!),
      pw.SizedBox(height: 12),
      pw.Text(
        synastry.birthChartB!.fullName,
        style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
      ),
      pw.SizedBox(height: 4),
      _buildInfoRow(
        l10n.dateOfBirth,
        date_utils.DateUtils.formatDate(context, synastry.birthChartB!.date),
      ),
      if (synastry.birthChartB!.place != null)
        _buildInfoRow(l10n.placeOfBirth, synastry.birthChartB!.place!),
    ];

    return _buildInfoBox(l10n.birthInformation, children);
  }

  pw.Widget _buildInfoRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 4),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(
            width: 120,
            child: pw.Text(
              '$label:',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.Expanded(child: pw.Text(value)),
        ],
      ),
    );
  }

  pw.Widget _buildInfoBox(String title, List<pw.Widget> children) {
    return pw.Container(
      width: double.infinity,
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.grey300),
        borderRadius: pw.BorderRadius.circular(8),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            title,
            style: pw.TextStyle(
              fontSize: 16,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.indigo,
            ),
          ),
          pw.SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  pw.Widget _buildDailyTransitInfo(
    BirthChart birthChart,
    DailyTransitReading transit,
    AppLocalizations l10n,
  ) {
    final children = <pw.Widget>[
      _buildInfoRow(l10n.person, birthChart.fullName),
      _buildInfoRow(
        l10n.dateOfBirth,
        date_utils.DateUtils.formatDate(context, birthChart.date),
      ),
      if (birthChart.place != null)
        _buildInfoRow(l10n.placeOfBirth, birthChart.place!),
      _buildInfoRow(
        l10n.transitDate,
        date_utils.DateUtils.formatDate(context, transit.date),
      ),
      _buildInfoRow(l10n.transitLocation, transit.location.place),
    ];

    return _buildInfoBox(l10n.transitInformation, children);
  }

  pw.Widget _buildMonthlyTransitInfo(
    BirthChart birthChart,
    MonthlyTransitReading transit,
    AppLocalizations l10n,
  ) {
    final monthName = date_utils.DateUtils.formatMonthYear(
      context,
      transit.month,
      transit.year,
    );

    final children = <pw.Widget>[
      _buildInfoRow(l10n.person, birthChart.fullName),
      _buildInfoRow(
        l10n.dateOfBirth,
        date_utils.DateUtils.formatDate(context, birthChart.date),
      ),
      if (birthChart.place != null)
        _buildInfoRow(l10n.placeOfBirth, birthChart.place!),
      _buildInfoRow(l10n.transitPeriod, monthName),
      _buildInfoRow(l10n.transitLocation, transit.location.place),
    ];

    return _buildInfoBox(l10n.transitInformation, children);
  }

  Future<Uint8List> generateDailyTransitPdf({
    required BirthChart birthChart,
    required DailyTransitReading transit,
  }) {
    final l10n = AppLocalizations.of(context)!;

    return _generatePdf(
      cacheKey: 'dailyTransit',
      id: transit.readingId,
      title: l10n.dailyTransitOf(birthChart.fullName),
      infoBox: _buildDailyTransitInfo(birthChart, transit, l10n),
      readingContent: transit.reading,
    );
  }

  Future<Uint8List> generateDailyTransitChartOnlyPdf({
    required BirthChart birthChart,
    required DailyTransitReading transit,
  }) {
    final l10n = AppLocalizations.of(context)!;

    return _generatePdf(
      cacheKey: 'dailyTransit',
      id: transit.readingId,
      title: l10n.dailyTransitOf(birthChart.fullName),
      infoBox: _buildDailyTransitInfo(birthChart, transit, l10n),
      chartOnly: true,
    );
  }

  Future<Uint8List> generateMonthlyTransitPdf({
    required BirthChart birthChart,
    required MonthlyTransitReading transit,
  }) {
    final l10n = AppLocalizations.of(context)!;

    return _generatePdf(
      cacheKey: 'monthlyTransit',
      id: transit.readingId,
      title: l10n.monthlyTransitOf(birthChart.fullName),
      infoBox: _buildMonthlyTransitInfo(birthChart, transit, l10n),
      readingContent: transit.reading,
    );
  }

  Future<Uint8List> generateMonthlyTransitChartOnlyPdf({
    required BirthChart birthChart,
    required MonthlyTransitReading transit,
  }) {
    final l10n = AppLocalizations.of(context)!;

    return _generatePdf(
      cacheKey: 'monthlyTransit',
      id: transit.readingId,
      title: l10n.monthlyTransitOf(birthChart.fullName),
      infoBox: _buildMonthlyTransitInfo(birthChart, transit, l10n),
      chartOnly: true,
    );
  }

  Future<List<pw.Widget>> _buildReadingContentWithImages(
    String reading,
    AppLocalizations l10n,
  ) async {
    final List<pw.Widget> widgets = [];

    // Clean content but preserve house illustration placeholders
    final cleanedContent = reading
        .replaceAll(RegExp(r'\[TABLE_CAVERNA_\d+\]'), '')
        .replaceAll(RegExp(r'\n{2,}'), '\n\n')
        .replaceAll('•', '·')
        .replaceAll('–', '-')
        .replaceAll('—', '-')
        .replaceAll('"', '"')
        .replaceAll('"', '"')
        .replaceAll(''', "'")
        .replaceAll(''', "'")
        .trim();

    // Split by lines and process each
    final lines = cleanedContent.split('\n');

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i].trim();
      if (line.isEmpty) continue;

      // Check for house illustration placeholder
      final houseMatch = RegExp(r'\[HOUSE_(\d+)_ILLUSTRATION\]').firstMatch(line);
      if (houseMatch != null) {
        final houseNumber = houseMatch.group(1)!;
        final cavernImage = await _buildCavernImage(houseNumber);
        if (cavernImage != null) {
          widgets.add(pw.SizedBox(height: 20));
          widgets.add(cavernImage);
          widgets.add(pw.SizedBox(height: 20));
        }
        continue;
      }

      // Check if line is a header
      if (line.startsWith('#')) {
        final headerLevel = line.indexOf(' ');
        if (headerLevel > 0) {
          final headerText = line.substring(headerLevel + 1);

          // Look ahead for content
          bool hasFollowingContent = false;
          int j = i + 1;
          while (j < lines.length) {
            final nextLine = lines[j].trim();
            if (nextLine.isEmpty) {
              j++;
              continue;
            }
            if (nextLine.startsWith('#') ||
                RegExp(r'\[HOUSE_\d+_ILLUSTRATION\]').hasMatch(nextLine)) {
              break;
            }
            hasFollowingContent = true;
            break;
          }

          final estimatedSpace =
              _estimateHeaderSpace(line) + (hasFollowingContent ? 60 : 0);
          widgets.add(pw.NewPage(freeSpace: estimatedSpace));
          widgets.add(_createHeaderWidget(line, headerText));
        }
      } else {
        // Regular content - accumulate consecutive non-header lines
        final contentLines = <String>[line];

        while (i + 1 < lines.length) {
          final nextLine = lines[i + 1].trim();
          if (nextLine.isEmpty ||
              nextLine.startsWith('#') ||
              RegExp(r'\[HOUSE_\d+_ILLUSTRATION\]').hasMatch(nextLine)) {
            break;
          }
          contentLines.add(nextLine);
          i++;
        }

        final contentText = contentLines.join('\n');
        if (contentText.trim().isNotEmpty) {
          widgets.add(
            pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 8),
              child: _buildFormattedText(contentText),
            ),
          );
        }
      }
    }

    return widgets;
  }

  double _estimateHeaderSpace(String headerLine) {
    if (headerLine.startsWith('####')) return 35; // H4: margin + text height
    if (headerLine.startsWith('###')) return 40; // H3: margin + text height
    if (headerLine.startsWith('##')) return 45; // H2: margin + text height
    if (headerLine.startsWith('#')) return 50; // H1: margin + text height
    return 30; // Default
  }

  pw.Widget _createHeaderWidget(String headerLine, String headerText) {
    if (headerLine.startsWith('####')) {
      return pw.Container(
        margin: const pw.EdgeInsets.only(top: 16, bottom: 8),
        child: pw.Text(
          headerText,
          style: pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.black,
          ),
        ),
      );
    } else if (headerLine.startsWith('###')) {
      return pw.Container(
        margin: const pw.EdgeInsets.only(top: 18, bottom: 10),
        child: pw.Text(
          headerText,
          style: pw.TextStyle(
            fontSize: 14,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.black,
          ),
        ),
      );
    } else if (headerLine.startsWith('##')) {
      return pw.Container(
        margin: const pw.EdgeInsets.only(top: 20, bottom: 12),
        child: pw.Text(
          headerText,
          style: pw.TextStyle(
            fontSize: 15,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.black,
          ),
        ),
      );
    } else if (headerLine.startsWith('#')) {
      return pw.Container(
        margin: const pw.EdgeInsets.only(top: 24, bottom: 14),
        child: pw.Text(
          headerText,
          style: pw.TextStyle(
            fontSize: 16,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.black,
          ),
        ),
      );
    }
    return pw.Container(); // Fallback
  }

  pw.Widget _buildFormattedText(String text) {
    // Pattern to match bold and italic markdown
    final RegExp markdownPattern = RegExp(r'(\*\*([^*]+)\*\*|\*([^*]+)\*)');
    final matches = markdownPattern.allMatches(text).toList();

    if (matches.isEmpty) {
      return pw.Text(
        text,
        style: const pw.TextStyle(fontSize: 11, lineSpacing: 1.4),
        textAlign: pw.TextAlign.justify,
      );
    }

    final List<pw.InlineSpan> spans = [];
    int lastIndex = 0;

    for (final match in matches) {
      // Add text before the match
      if (match.start > lastIndex) {
        spans.add(
          pw.TextSpan(
            text: text.substring(lastIndex, match.start),
            style: const pw.TextStyle(fontSize: 11),
          ),
        );
      }

      // Add formatted text
      if (match.group(0)!.startsWith('**')) {
        // Bold text
        spans.add(
          pw.TextSpan(
            text: match.group(2)!,
            style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold),
          ),
        );
      } else {
        // Italic text
        spans.add(
          pw.TextSpan(
            text: match.group(3)!,
            style: pw.TextStyle(fontSize: 11, fontStyle: pw.FontStyle.italic),
          ),
        );
      }

      lastIndex = match.end;
    }

    // Add remaining text
    if (lastIndex < text.length) {
      spans.add(
        pw.TextSpan(
          text: text.substring(lastIndex),
          style: const pw.TextStyle(fontSize: 11),
        ),
      );
    }

    return pw.RichText(
      text: pw.TextSpan(
        children: spans,
        style: const pw.TextStyle(fontSize: 11, lineSpacing: 1.4),
      ),
      textAlign: pw.TextAlign.justify,
    );
  }

  Future<String> savePdfToDevice(Uint8List pdfBytes, String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$filename');
    await file.writeAsBytes(pdfBytes);
    return file.path;
  }

  Future<void> printPdf(Uint8List pdfBytes) async {
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdfBytes,
    );
  }

  Future<bool> sharePdf(Uint8List pdfBytes, String filename) async {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS || Platform.isLinux)) {
      final l10n = AppLocalizations.of(context)!;
      final result = await FilePicker.platform.saveFile(
        dialogTitle: l10n.savePdfDialogTitle,
        fileName: filename,
        bytes: pdfBytes,
      );
      return result != null;
    } else {
      await FileSaver.instance.saveFile(
        bytes: pdfBytes,
        name: filename,
        mimeType: MimeType.pdf,
      );
      return true;
    }
  }
}
