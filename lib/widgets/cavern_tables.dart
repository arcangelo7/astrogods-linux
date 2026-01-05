import 'package:flutter/material.dart';
import '../constants/text_styles.dart';
import '../l10n/app_localizations.dart';

class _TableTheme {
  final Color borderColor;
  final Color headerBgColor;
  final Color headerBgColorStrong;
  final Color secondaryBgColor;
  final EdgeInsets padding;
  final BorderSide borderSide;
  final TextStyle strongStyle;
  final TextStyle paragraphStyle;

  _TableTheme(BuildContext context)
      : borderColor = Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
        headerBgColor = Theme.of(context).colorScheme.primary.withValues(alpha: 0.05),
        headerBgColorStrong = Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
        secondaryBgColor = Theme.of(context).colorScheme.secondary.withValues(alpha: 0.05),
        padding = EdgeInsets.all(_getResponsivePadding(context)),
        borderSide = BorderSide(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
          width: 1,
        ),
        strongStyle = AppTextStyles.getMarkdownStrongStyle(context),
        paragraphStyle = AppTextStyles.getMarkdownParagraphStyle(context);

  static double _getResponsivePadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth < 1400 ? 6.0 : 12.0;
  }
}

class CavernTables {
  static Widget getPrimaDivisioneTable(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final t = _TableTheme(context);

    return _ResponsiveTable(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: t.borderColor,
            width: 1,
          ),
        ),
        child: Column(
          children: [
          // Header row (Prima Divisione)
          Container(
            width: double.infinity,
            padding: t.padding,
            decoration: BoxDecoration(
              color: t.headerBgColorStrong,
              border: Border(
                bottom: BorderSide(color: t.borderColor, width: 1),
              ),
            ),
            child: Text(
              l10n.firstDivisionTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.getMarkdownStrongStyle(context),
            ),
          ),
          // R1 section
          _buildRowSpanSection(context, 'R1', [
            ['S1', 'S2', 'S3'],
            [
              l10n.table1R1S1,
              l10n.table1R1S2,
              l10n.table1R1S3,
            ],
          ]),
          // R2 section
          _buildRowSpanSection(context, 'R2', [
            ['S1', 'S2', 'S3'],
            [
              l10n.table1R2S1,
              l10n.table1R2S2,
              l10n.table1R2S3,
            ],
          ]),
          // R3 section
          _buildRowSpanSectionWithColspan(
            context,
            'R3',
            [
              ['S1', 'S2'],
              [
                l10n.table1R3S1,
                l10n.table1R3S2,
              ],
            ],
            [1, 2],
          ), // S1=1 column, S2=2 columns
          // R4 section
          _buildRowSpanSection(context, 'R4', [
            ['S1', 'S2', 'S3'],
            [
              l10n.table1R4S1,
              l10n.table1R4S2,
              l10n.table1R4S3,
            ],
          ]),
          // R5 section
          _buildRowSpanSectionWithColspan(
            context,
            'R5',
            [
              ['S1', 'S2'],
              [l10n.table1R5S1, l10n.table1R5S2],
            ],
            [1, 2],
          ), // S1=1 column, S2=2 columns
          ],
        ),
      ),
    );
  }

  static Widget _buildRowSpanSection(
    BuildContext context,
    String rLabel,
    List<List<String>> rows,
  ) {
    final t = _TableTheme(context);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // R label spanning 2 rows
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: t.headerBgColor,
                border: Border(right: t.borderSide, bottom: t.borderSide),
              ),
              child: Center(
                child: Text(rLabel, style: t.strongStyle, textAlign: TextAlign.center),
              ),
            ),
          ),
          // Right side with 2 rows
          Expanded(
            flex: 6,
            child: Column(
              children: [
                for (int rowIndex = 0; rowIndex < rows.length; rowIndex++)
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (int colIndex = 0; colIndex < rows[rowIndex].length; colIndex++)
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: t.padding,
                              decoration: BoxDecoration(
                                color: rowIndex == 0 ? t.headerBgColor : null,
                                border: Border(
                                  right: colIndex < rows[rowIndex].length - 1
                                      ? t.borderSide
                                      : BorderSide.none,
                                  bottom: t.borderSide,
                                ),
                              ),
                              child: Text(
                                rows[rowIndex][colIndex],
                                textAlign: TextAlign.center,
                                style: rowIndex == 0 ? t.strongStyle : t.paragraphStyle,
                              ),
                            ),
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

  static Widget _buildRowSpanSectionWithColspan(
    BuildContext context,
    String rLabel,
    List<List<String>> rows,
    List<int> colSpans,
  ) {
    final t = _TableTheme(context);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // R label spanning 2 rows
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: t.headerBgColor,
                border: Border(right: t.borderSide, bottom: t.borderSide),
              ),
              child: Center(
                child: Text(rLabel, style: t.strongStyle, textAlign: TextAlign.center),
              ),
            ),
          ),
          // Right side with 2 rows and custom colspan
          Expanded(
            flex: 6,
            child: Column(
              children: [
                for (int rowIndex = 0; rowIndex < rows.length; rowIndex++)
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (int colIndex = 0; colIndex < rows[rowIndex].length; colIndex++)
                          Expanded(
                            flex: colSpans[colIndex],
                            child: Container(
                              padding: t.padding,
                              decoration: BoxDecoration(
                                color: rowIndex == 0 ? t.headerBgColor : null,
                                border: Border(
                                  right: colIndex < rows[rowIndex].length - 1
                                      ? t.borderSide
                                      : BorderSide.none,
                                  bottom: t.borderSide,
                                ),
                              ),
                              child: Text(
                                rows[rowIndex][colIndex],
                                textAlign: TextAlign.center,
                                style: rowIndex == 0 ? t.strongStyle : t.paragraphStyle,
                              ),
                            ),
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

  static Widget getSecondaDivisioneTable(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final t = _TableTheme(context);

    return _ResponsiveTable(
      child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: t.borderColor, width: 1),
      ),
      child: Column(
        children: [
          // Header row (Division Two)
          Container(
            width: double.infinity,
            padding: t.padding,
            decoration: BoxDecoration(
              color: t.headerBgColorStrong,
              border: Border(bottom: BorderSide(color: t.borderColor, width: 1)),
            ),
            child: Text(
              l10n.secondDivisionTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.getMarkdownStrongStyle(context),
            ),
          ),
          // R1 section
          _buildRowSpanSection(context, 'R1', [
            ['S1', 'S2', 'S3'],
            [
              l10n.table2R1S1,
              l10n.table2R1S2,
              l10n.table2R1S3,
            ],
          ]),
          // R2 section
          _buildRowSpanSection(context, 'R2', [
            ['S1', 'S2'],
            [
              l10n.table2R2S1,
              l10n.table2R2S2,
            ],
          ]),
          // R3 section
          _buildRowSpanSection(context, 'R3', [
            ['S1', 'S2'],
            [
              l10n.table2R3S1,
              l10n.table2R3S2,
            ],
          ]),
          // R4 section
          _buildRowSpanSection(context, 'R4', [
            ['S1', 'S2'],
            [
              l10n.table2R4S1,
              l10n.table2R4S2,
            ],
          ]),
          // R5 section
          _buildRowSpanSection(context, 'R5', [
            ['S1'],
            [
              l10n.table2R5S1,
            ],
          ]),
        ],
      ),
      ),
    );
  }

  static Widget getTerzaDivisioneTable(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final t = _TableTheme(context);

    return _ResponsiveTable(
      child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: t.borderColor, width: 1),
      ),
      child: Column(
        children: [
          // Header row (Division Three)
          Container(
            width: double.infinity,
            padding: t.padding,
            decoration: BoxDecoration(
              color: t.headerBgColorStrong,
              border: Border(bottom: BorderSide(color: t.borderColor, width: 1)),
            ),
            child: Text(
              l10n.divisionStructureAlt3,
              textAlign: TextAlign.center,
              style: AppTextStyles.getMarkdownStrongStyle(context),
            ),
          ),
          // R1 section
          _buildRowSpanSection(context, 'R1', [
            ['S1', 'S2', 'S3', 'S4', 'S5'],
            [
              l10n.table3R1S1,
              l10n.table3R1S2,
              l10n.table3R1S3,
              l10n.table3R1S4,
              l10n.table3R1S5,
            ],
          ]),
          // R2 section
          _buildRowSpanSection(context, 'R2', [
            ['S1', 'S2', 'S3\n(${l10n.centralScene})', 'S4', 'S5'],
            [
              l10n.table3R2S1,
              l10n.table3R2S2,
              l10n.table3R2S3,
              l10n.table3R2S4,
              l10n.table3R2S5,
            ],
          ]),
          // R3 section
          _buildRowSpanSection(context, 'R3', [
            ['S1', 'S2', 'S3'],
            [
              l10n.table3R3S1,
              l10n.table3R3S2,
              l10n.table3R3S3,
            ],
          ]),
        ],
      ),
      ),
    );
  }

  static Widget getQuartaDivisioneTable(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final t = _TableTheme(context);

    return _ResponsiveTable(
      child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: t.borderColor, width: 1),
      ),
      child: Column(
        children: [
          // Header row (Division Four)
          Container(
            width: double.infinity,
            padding: t.padding,
            decoration: BoxDecoration(
              color: t.headerBgColorStrong,
              border: Border(bottom: BorderSide(color: t.borderColor, width: 1)),
            ),
            child: Text(
              l10n.divisionStructureAlt4,
              textAlign: TextAlign.center,
              style: AppTextStyles.getMarkdownStrongStyle(context),
            ),
          ),
          // R1 section
          _buildRowSpanSection(context, 'R1', [
            ['S1', 'S2', 'S3'],
            [
              l10n.table4R1S1,
              l10n.table4R1S2,
              l10n.table4R1S3,
            ],
          ]),
          // R2 section
          _buildRowSpanSection(context, 'R2', [
            ['S1', 'S2', 'S3'],
            [
              l10n.table4R2S1,
              l10n.table4R2S2,
              l10n.table4R2S3,
            ],
          ]),
          // R3 section
          _buildRowSpanSection(context, 'R3', [
            ['S1', 'S2', 'S3'],
            [
              l10n.table4R3S1,
              l10n.table4R3S2,
              l10n.table4R3S3,
            ],
          ]),
        ],
      ),
      ),
    );
  }

  static Widget getQuintaDivisioneTable(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final t = _TableTheme(context);

    return _ResponsiveTable(
      child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: t.borderColor, width: 1),
      ),
      child: Column(
        children: [
          // Header row (Division Five)
          Container(
            width: double.infinity,
            padding: t.padding,
            decoration: BoxDecoration(
              color: t.headerBgColorStrong,
              border: Border(bottom: BorderSide(color: t.borderColor, width: 1)),
            ),
            child: Text(
              l10n.table5Division,
              textAlign: TextAlign.center,
              style: AppTextStyles.getMarkdownStrongStyle(context),
            ),
          ),
          // Complex table with spanning columns
          _buildFifthDivisionComplexTable(context),
        ],
      ),
      ),
    );
  }

  static Widget _buildFifthDivisionComplexTable(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final t = _TableTheme(context);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // R1, R2, R3 column
          Expanded(
            flex: 1,
            child: Column(
              children: [
                // R1
                Expanded(
                  flex: 2, // Header + Data
                  child: Container(
                    decoration: BoxDecoration(
                      color: t.headerBgColor,
                      border: Border(
                        right: BorderSide(
                          color: t.borderColor,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: t.borderColor,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'R1',
                        style: AppTextStyles.getMarkdownStrongStyle(context),
                      ),
                    ),
                  ),
                ),
                // R2
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: t.headerBgColor,
                      border: Border(
                        right: BorderSide(
                          color: t.borderColor,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: t.borderColor,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'R2',
                        style: AppTextStyles.getMarkdownStrongStyle(context),
                      ),
                    ),
                  ),
                ),
                // R3
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: t.headerBgColor,
                      border: Border(
                        right: BorderSide(
                          color: t.borderColor,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'R3',
                        style: AppTextStyles.getMarkdownStrongStyle(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Large Nut column (spanning all rows)
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: t.secondaryBgColor,
                border: Border(
                  right: BorderSide(
                    color: t.borderColor,
                    width: 1,
                  ),
                ),
              ),
              child: Center(
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    l10n.largeNut,
                    style: AppTextStyles.getMarkdownStrongStyle(context),
                  ),
                ),
              ),
            ),
          ),
          // S1(1) column
          Expanded(
            flex: 2,
            child: Column(
              children: [
                // R1 section
                Expanded(
                  child: Column(
                    children: [
                      // S1(1) header for R1
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: t.headerBgColorStrong,
                          border: Border(
                            right: BorderSide(
                              color: t.borderColor,
                              width: 1,
                            ),
                            bottom: BorderSide(
                              color: t.borderColor,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'S1(1)',
                            style: AppTextStyles.getMarkdownStrongStyle(context),
                          ),
                        ),
                      ),
                      // R1 data
                      Expanded(
                        child: Container(
                          padding: t.padding,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: t.borderColor,
                                width: 1,
                              ),
                              bottom: BorderSide(
                                color: t.borderColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              l10n.table5R1S1P1,
                              style: AppTextStyles.getMarkdownParagraphStyle(context),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // R2 section
                Expanded(
                  child: Column(
                    children: [
                      // S1(1) header for R2
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: t.headerBgColorStrong,
                          border: Border(
                            right: BorderSide(
                              color: t.borderColor,
                              width: 1,
                            ),
                            bottom: BorderSide(
                              color: t.borderColor,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'S1(1)',
                            style: AppTextStyles.getMarkdownStrongStyle(context),
                          ),
                        ),
                      ),
                      // R2 data
                      Expanded(
                        child: Container(
                          padding: t.padding,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: t.borderColor,
                                width: 1,
                              ),
                              bottom: BorderSide(
                                color: t.borderColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              l10n.table5R2S1P1,
                              style: AppTextStyles.getMarkdownParagraphStyle(context),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // R3 section
                Expanded(
                  child: Column(
                    children: [
                      // S1(1) header for R3
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: t.headerBgColorStrong,
                          border: Border(
                            right: BorderSide(
                              color: t.borderColor,
                              width: 1,
                            ),
                            bottom: BorderSide(
                              color: t.borderColor,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'S1(1)',
                            style: AppTextStyles.getMarkdownStrongStyle(context),
                          ),
                        ),
                      ),
                      // R3 data
                      Expanded(
                        child: Container(
                          padding: t.padding,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: t.borderColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              l10n.table5R3S1P1,
                              style: AppTextStyles.getMarkdownParagraphStyle(context),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // S2(1) + S3(1) combined column
          Expanded(
            flex: 4, // Double width to accommodate two columns
            child: Column(
              children: [
                // R1 section (two separate columns)
                Expanded(
                  child: Row(
                    children: [
                      // S2(1) column for R1
                      Expanded(
                        child: Column(
                          children: [
                            // S2(1) header for R1
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: t.headerBgColorStrong,
                                border: Border(
                                  right: BorderSide(
                                    color: t.borderColor,
                                    width: 1,
                                  ),
                                  bottom: BorderSide(
                                    color: t.borderColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'S2(1)',
                                  style: AppTextStyles.getMarkdownStrongStyle(context),
                                ),
                              ),
                            ),
                            // R1 S2(1) data
                            Expanded(
                              child: Container(
                                padding: t.padding,
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: t.borderColor,
                                      width: 1,
                                    ),
                                    bottom: BorderSide(
                                      color: t.borderColor,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    l10n.table5R1S2P1,
                                    style: AppTextStyles.getMarkdownParagraphStyle(context),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // S3(1) column for R1
                      Expanded(
                        child: Column(
                          children: [
                            // S3(1) header for R1
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: t.headerBgColorStrong,
                                border: Border(
                                  right: BorderSide(
                                    color: t.borderColor,
                                    width: 1,
                                  ),
                                  bottom: BorderSide(
                                    color: t.borderColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'S3(1)',
                                  style: AppTextStyles.getMarkdownStrongStyle(context),
                                ),
                              ),
                            ),
                            // R1 S3(1) data
                            Expanded(
                              child: Container(
                                padding: t.padding,
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: t.borderColor,
                                      width: 1,
                                    ),
                                    bottom: BorderSide(
                                      color: t.borderColor,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    l10n.table5R1S3P1,
                                    style: AppTextStyles.getMarkdownParagraphStyle(context),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // R2 section (S2(1) spans two columns)
                Expanded(
                  child: Column(
                    children: [
                      // S2(1) header for R2 spanning both columns
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: t.headerBgColorStrong,
                          border: Border(
                            right: BorderSide(
                              color: t.borderColor,
                              width: 1,
                            ),
                            bottom: BorderSide(
                              color: t.borderColor,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'S2(1)',
                            style: AppTextStyles.getMarkdownStrongStyle(context),
                          ),
                        ),
                      ),
                      // R2 data spanning both columns
                      Expanded(
                        child: Container(
                          padding: t.padding,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: t.borderColor,
                                width: 1,
                              ),
                              bottom: BorderSide(
                                color: t.borderColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              l10n.table5R2S2P1,
                              style: AppTextStyles.getMarkdownParagraphStyle(context),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // R3 section (two separate columns)
                Expanded(
                  child: Row(
                    children: [
                      // S2(1) column for R3
                      Expanded(
                        child: Column(
                          children: [
                            // S2(1) header for R3
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: t.headerBgColorStrong,
                                border: Border(
                                  right: BorderSide(
                                    color: t.borderColor,
                                    width: 1,
                                  ),
                                  bottom: BorderSide(
                                    color: t.borderColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'S2(1)',
                                  style: AppTextStyles.getMarkdownStrongStyle(context),
                                ),
                              ),
                            ),
                            // R3 S2(1) data
                            Expanded(
                              child: Container(
                                padding: t.padding,
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: t.borderColor,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    l10n.table5R3S2P1,
                                    style: AppTextStyles.getMarkdownParagraphStyle(context),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // S3(1) column for R3
                      Expanded(
                        child: Column(
                          children: [
                            // S3(1) header for R3
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: t.headerBgColorStrong,
                                border: Border(
                                  right: BorderSide(
                                    color: t.borderColor,
                                    width: 1,
                                  ),
                                  bottom: BorderSide(
                                    color: t.borderColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'S3(1)',
                                  style: AppTextStyles.getMarkdownStrongStyle(context),
                                ),
                              ),
                            ),
                            // R3 S3(1) data
                            Expanded(
                              child: Container(
                                padding: t.padding,
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: t.borderColor,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    l10n.table5R3S3P1,
                                    style: AppTextStyles.getMarkdownParagraphStyle(context),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Large Ithyphallic Osiris column (spanning all rows)
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: t.secondaryBgColor,
                border: Border(
                  right: BorderSide(
                    color: t.borderColor,
                    width: 1,
                  ),
                ),
              ),
              child: Center(
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    l10n.largeIthyphallicOsiris,
                    style: AppTextStyles.getMarkdownStrongStyle(context),
                  ),
                ),
              ),
            ),
          ),
          // S1(2) and S2(2) column
          Expanded(
            flex: 2,
            child: Column(
              children: [
                // R1 section
                Expanded(
                  child: Column(
                    children: [
                      // S1(2) header for R1
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: t.headerBgColorStrong,
                          border: Border(
                            bottom: BorderSide(
                              color: t.borderColor,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'S1(2)',
                            style: AppTextStyles.getMarkdownStrongStyle(context),
                          ),
                        ),
                      ),
                      // R1 data
                      Expanded(
                        child: Container(
                          padding: t.padding,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: t.borderColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              l10n.table5R1S1P2,
                              style: AppTextStyles.getMarkdownParagraphStyle(context),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // R2 section (split between S1(2) and S2(2))
                Expanded(
                  child: Row(
                    children: [
                      // S1(2) for R2
                      Expanded(
                        child: Column(
                          children: [
                            // S1(2) header for R2
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: t.headerBgColorStrong,
                                border: Border(
                                  right: BorderSide(
                                    color: t.borderColor,
                                    width: 1,
                                  ),
                                  bottom: BorderSide(
                                    color: t.borderColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'S1(2)',
                                  style: AppTextStyles.getMarkdownStrongStyle(context),
                                ),
                              ),
                            ),
                            // R2 S1(2) data
                            Expanded(
                              child: Container(
                                padding: t.padding,
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: t.borderColor,
                                      width: 1,
                                    ),
                                    bottom: BorderSide(
                                      color: t.borderColor,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    l10n.table5R2S1P2,
                                    style: AppTextStyles.getMarkdownParagraphStyle(context),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // S2(2) for R2
                      Expanded(
                        child: Column(
                          children: [
                            // S2(2) header for R2
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: t.headerBgColorStrong,
                                border: Border(
                                  bottom: BorderSide(
                                    color: t.borderColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'S2(2)',
                                  style: AppTextStyles.getMarkdownStrongStyle(context),
                                ),
                              ),
                            ),
                            // R2 S2(2) data
                            Expanded(
                              child: Container(
                                padding: t.padding,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: t.borderColor,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    l10n.table5R2S2P2,
                                    style: AppTextStyles.getMarkdownParagraphStyle(context),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // R3 section
                Expanded(
                  child: Column(
                    children: [
                      // S1(2) header for R3
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: t.headerBgColorStrong,
                          border: Border(
                            bottom: BorderSide(
                              color: t.borderColor,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'S1(2)',
                            style: AppTextStyles.getMarkdownStrongStyle(context),
                          ),
                        ),
                      ),
                      // R3 data
                      Expanded(
                        child: Container(
                          padding: t.padding,
                          child: Center(
                            child: Text(
                              l10n.table5R3S1P2,
                              style: AppTextStyles.getMarkdownParagraphStyle(context),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
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

  static Widget getSestaDivisioneTable(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final t = _TableTheme(context);

    return _ResponsiveTable(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: t.borderColor, width: 1),
        ),
        child: Column(
          children: [
            // Header row (Sesta Divisione)
            Container(
              width: double.infinity,
              padding: t.padding,
              decoration: BoxDecoration(
                color: t.headerBgColorStrong,
                border: Border(bottom: BorderSide(color: t.borderColor, width: 1)),
              ),
              child: Text(
                l10n.table6Division,
                textAlign: TextAlign.center,
                style: AppTextStyles.getMarkdownStrongStyle(context),
              ),
            ),
            // R1 section
            _buildRowSpanSection(context, 'R1', [
              ['S1', 'S2', 'S3', 'S4'],
              [
                l10n.table6R1S1,
                l10n.table6R1S2,
                l10n.table6R1S3,
                l10n.table6R1S4,
              ],
            ]),
            // R2 section
            _buildRowSpanSection(context, 'R2', [
              ['S1', 'S2', 'S3', 'S4', 'S5'],
              [
                l10n.table6R2S1,
                l10n.table6R2S2,
                l10n.table6R2S3,
                l10n.table6R2S4,
                l10n.table6R2S5,
              ],
            ]),
            // R3 section
            _buildRowSpanSection(context, 'R3', [
              ['S1', 'S2', 'S3', 'S4'],
              [
                l10n.table6R3S1,
                l10n.table6R3S2,
                l10n.table6R3S3,
                l10n.table6R3S4,
              ],
            ]),
          ],
        ),
      ),
    );
  }
}

class _ResponsiveTable extends StatelessWidget {
  final Widget child;

  const _ResponsiveTable({required this.child});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const tableWidth = 1400.0;
    final needsScroll = screenWidth < tableWidth;
    
    if (needsScroll) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.swipe,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                ),
                const SizedBox(width: 4),
                Text(
                  AppLocalizations.of(context)!.swipeToView,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: tableWidth,
              child: child,
            ),
          ),
        ],
      );
    }
    
    // Desktop: fixed width centered
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: tableWidth,
          child: child,
        ),
      ),
    );
  }
}
