import 'package:flutter/foundation.dart';

/// A jurisdiction an AANES plate names in its left block: the Jazira Region's
/// districts, and the other regions of the administration.
///
/// The names are the plate's own, not the Damascus government's — قامشلو
/// (Qamishlo), not القامشلي; كوباني, not عين العرب.
@immutable
class AanesRegion {
  const AanesRegion({
    required this.id,
    required this.english,
    required this.arabic,
    required this.code,
    this.syriac,
  });

  /// Stable key, used in spec ids.
  final String id;
  final String english;
  final String arabic;

  /// The three-letter code derived from Kurdish.
  final String code;

  /// The Syriac name, printed by the Jazira districts that have one. A region
  /// with one gets the trilingual left block, one without the bilingual.
  final String? syriac;

  bool get isTrilingual => syriac != null;

  /// Four disconnected letters abbreviating ܩܡܫܠܐ.
  static const AanesRegion qamishli = AanesRegion(
    id: 'qamishli',
    english: 'Qamishli',
    arabic: 'قامشلو',
    code: 'QMŞ',
    syriac: 'ܩ ܡ ܫ ܐ',
  );

  static const AanesRegion hasaka = AanesRegion(
    id: 'hasaka',
    english: 'Hasaka',
    arabic: 'الحسكة',
    code: 'HSK',
    syriac: 'ܚܣܝܟܐ',
  );

  static const AanesRegion derik = AanesRegion(
    id: 'derik',
    english: 'Al-Malikiyah',
    arabic: 'ديرك',
    code: 'DRK',
  );

  static const AanesRegion kobani = AanesRegion(
    id: 'kobani',
    english: 'Kobani',
    arabic: 'كوباني',
    code: 'KBN',
  );

  static const AanesRegion afrin = AanesRegion(
    id: 'afrin',
    english: 'Afrin',
    arabic: 'عفرين',
    code: 'EFR',
  );

  static const AanesRegion raqqa = AanesRegion(
    id: 'raqqa',
    english: 'Raqqa',
    arabic: 'الرقة',
    code: 'RQE',
  );

  static const AanesRegion tabqa = AanesRegion(
    id: 'tabqa',
    english: 'Al-Tabqah',
    arabic: 'الطبقة',
    code: 'TBQ',
  );

  static const AanesRegion manbij = AanesRegion(
    id: 'manbij',
    english: 'Manbij',
    arabic: 'منبج',
    code: 'MNB',
  );

  static const AanesRegion deirEzZor = AanesRegion(
    id: 'deirEzZor',
    english: 'Deir ez-Zor',
    arabic: 'دير الزور',
    code: 'DRZ',
  );

  static const List<AanesRegion> values = <AanesRegion>[
    qamishli,
    hasaka,
    derik,
    kobani,
    afrin,
    raqqa,
    tabqa,
    manbij,
    deirEzZor,
  ];
}
