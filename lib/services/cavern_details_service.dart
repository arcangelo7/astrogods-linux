import 'package:flutter/material.dart';
import '../models/cavern_details.dart';
import '../l10n/app_localizations.dart';

class CavernDetailsService {
  static String getBookOfCavernsIntroduction(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return l10n.bookOfCavernsIntroduction;
  }

  static List<CavernDetails> getAllCavernDetails(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final introduction = l10n.bookOfCavernsIntroduction;
    return [
      CavernDetails(
        houseNumber: 1,
        title: l10n.firstCavernTitle,
        introduction: introduction,
        literalMeaning: l10n.firstCavernLiteralMeaning,
        esotericMeaning: l10n.firstCavernEsotericMeaning,
        imagePath: 'prima_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 2,
        title: l10n.secondCavernTitle,
        introduction: introduction,
        literalMeaning: l10n.secondCavernLiteralMeaning,
        esotericMeaning: l10n.secondCavernEsotericMeaning,
        imagePath: 'seconda_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 3,
        title: l10n.thirdCavernTitle,
        introduction: introduction,
        literalMeaning: l10n.thirdCavernLiteralMeaning,
        esotericMeaning: l10n.thirdCavernEsotericMeaning,
        imagePath: 'terza_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 4,
        title: l10n.fourthCavernTitle,
        introduction: introduction,
        literalMeaning: l10n.fourthCavernLiteralMeaning,
        esotericMeaning: l10n.fourthCavernEsotericMeaning,
        imagePath: 'quarta_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 5,
        title: l10n.fifthCavernTitle,
        introduction: introduction,
        literalMeaning: l10n.fifthCavernLiteralMeaning,
        esotericMeaning: l10n.fifthCavernEsotericMeaning,
        imagePath: 'quinta_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 6,
        title: l10n.sixthCavernTitle,
        introduction: introduction,
        literalMeaning: l10n.sixthCavernLiteralMeaning,
        esotericMeaning: l10n.sixthCavernEsotericMeaning,
        imagePath: 'sesta_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 7,
        title: l10n.seventhCavernTitle,
        introduction: introduction,
        literalMeaning: l10n.seventhCavernLiteralMeaning,
        esotericMeaning: l10n.seventhCavernEsotericMeaning,
        imagePath: null,
      ),
      CavernDetails(
        houseNumber: 8,
        title: l10n.eighthCavernTitle,
        introduction: introduction,
        literalMeaning: l10n.eighthCavernLiteralMeaning,
        esotericMeaning: l10n.eighthCavernEsotericMeaning,
        imagePath: 'ottava_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 9,
        title: l10n.ninthCavernTitle,
        introduction: introduction,
        literalMeaning: l10n.ninthCavernLiteralMeaning,
        esotericMeaning: l10n.ninthCavernEsotericMeaning,
        imagePath: 'nona_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 10,
        title: l10n.tenthCavernTitle,
        introduction: introduction,
        literalMeaning: l10n.tenthCavernLiteralMeaning,
        esotericMeaning: l10n.tenthCavernEsotericMeaning,
        imagePath: 'decima_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 11,
        title: l10n.eleventhCavernTitle,
        introduction: introduction,
        literalMeaning: l10n.eleventhCavernLiteralMeaning,
        esotericMeaning: l10n.eleventhCavernEsotericMeaning,
        imagePath: 'undicesima_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 12,
        title: l10n.twelfthCavernTitle,
        introduction: introduction,
        literalMeaning: l10n.twelfthCavernLiteralMeaning,
        esotericMeaning: l10n.twelfthCavernEsotericMeaning,
        imagePath: 'dodicesima_caverna.webp',
      ),
    ];
  }

  static CavernDetails? getCavernDetailsByHouse(int houseNumber, BuildContext context) {
    try {
      return getAllCavernDetails(context).firstWhere(
        (cavern) => cavern.houseNumber == houseNumber,
      );
    } catch (e) {
      return null;
    }
  }

  static String getHouseTag(int houseNumber) {
    return '[HOUSE_${houseNumber}_ILLUSTRATION]';
  }

  static int? getHouseNumberFromTag(String tag) {
    final RegExp regExp = RegExp(r'\[HOUSE_(\d+)_ILLUSTRATION\]');
    final match = regExp.firstMatch(tag);
    if (match != null) {
      return int.tryParse(match.group(1)!);
    }
    return null;
  }
}
