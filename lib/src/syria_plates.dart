import 'dart:math';

import 'package:plate_core/plate_core.dart';
import 'package:flutter/widgets.dart';

import 'aanes_regions.dart';
import 'syria_alphabets.dart';
import 'syria_colors.dart';
import 'syria_country.dart';

/// The transitional government's plate, measured off
/// `Syria_License_Plate_(2025-).png` by normalising its plate rectangle
/// (980×210 px) to 520 units wide. The article gives no size in mm, so the
/// canvas keeps the artwork's 4.67 aspect: 520 × 111.4.
///
/// `NN NNNNN`: a two-digit code, then a five-digit serial. Between the groups,
/// stacked: سورية (ink y 18–34), the flag (x 152.8–203.8, three 10.6-unit
/// stripes from y 39.3), SYR (ink y 75.9–90.7). The flag is a section of the
/// background; its stars are a red label on the white stripe.
///
/// Reference digit ink is 76 units tall (y 17.5–93.4). Slot ink is ~0.525 of
/// the box, so that would need a 145-unit box on a 111-unit plate; the box is
/// the full height and the digits come out ~77% of reference.
abstract final class _Transitional {
  static const double width = 520;
  static const double height = 111.4;
  static const double pitch = 55.2;
  static const double codeLeft = 22.8;
  static const double serialLeft = 218.6;
  static const double flagLeft = 152.8;
  static const double flagRight = 203.8;
  static const double flagTop = 39.3;
  static const double stripe = 10.6;
  static const double captionX = 178.3;
}

/// The AANES car plate, measured off the six `AANES_license_plate_-_*.png`
/// (1040×240 px, normalised to 520 × 120 — again no mm in the article).
///
/// Four columns split by 2-unit rules edge to edge: the region block
/// (0–209.75), "SYR" stacked (–259.75), "B ✷ S" stacked (–309.75), and the
/// number (–520), itself split at y 59.75 into Western digits over Eastern
/// Arabic. The region block is split at y 41.25 and 78.25 (code / Syriac /
/// Arabic) when the region has a Syriac name, at 59.75 (code / Arabic) when not.
///
/// Measured ink: digits y 8–53 at pitch 34.1, first centre x 329.8; Eastern
/// digits y 71–109; stacked caps 24 tall centred y 17.25 / 58.25 / 99.25 at
/// x 234.75 and 284.75, the sun 30.5 across at y 61.25. The top digit box is
/// capped at 61 by the plate's top edge, so those digits are ~71% of
/// reference; the Eastern row is a mirror with its own glyph height and is not.
abstract final class _Aanes {
  static const double width = 520;
  static const double height = 120;
  static const double rule = 2;
  static const double regionEnd = 209.75;
  static const double syrEnd = 259.75;
  static const double bsEnd = 309.75;
  static const double midline = 59.75;
  static const double syrX = 234.75;
  static const double bsX = 284.75;
  static const double regionX = 104;
  static const double digitLeft = 312.8;
  static const double pitch = 34.1;

  /// The plate's own Kurdish sun, as the nearest glyph a font carries.
  static const String sun = '✷';
}

/// The AANES motorcycle plate, `AANES_license_plate_-_Motorcycle.png`
/// (523×240 px → 261.5 × 120, the car plate's scale). "B ✷ S" in a column
/// to x 51.25, then code and Arabic name over a letter and four digits,
/// split at y 59.75. Measured: code caps y 20–42.5 centred x 101, name
/// centred (208.5, 31.25), letter A ink 33.5 tall centred x 88, digits 45 tall
/// at pitch 34.75 from x 108.6. Boxes are capped by the lower cell (58), so
/// the digits are ~68% of reference; the letter keeps its smaller ratio.
abstract final class _Moto {
  static const double width = 261.5;
  static const double height = 120;
  static const double columnEnd = 51.25;
  static const double bsX = 25.75;
  static const double pitch = 34.75;
}

/// Syria's current plates. The 1997 series and the opposition-held
/// territories' plates are historical and not built.
///
/// Colour is not on any spec: [transitional] is private or commercial by
/// `SyriaThemes.private`/`commercial`; an [aanes] plate by one of the four
/// `SyriaThemes.aanes*`.
abstract final class SyriaPlates {
  /// The family the Syriac row asks for. Not bundled: the host supplies a
  /// face under this name, or the row falls back to whatever has the glyphs.
  static const String syriacFont = 'Noto Sans Syriac';

  /// One field of [count] cells at [pitch] from [left]; `spacing` brings the
  /// font's advance up to the pitch.
  static PlateSlot _run(
    PlateAlphabet alphabet,
    int count,
    double left,
    double top,
    double pitch,
    double height,
  ) => PlateSlot(
    alphabet: alphabet,
    box: PlateBox(left, top, count * pitch, height),
    length: count,
    spacing: max(0, pitch - 0.6 * 0.72 * height),
  );

  static const PlatePanel _noPanel = PlatePanel(box: PlateBox(0, 0, 0, 1));

  static PlateLabel _label(
    String text,
    double cx,
    double cy,
    double glyphHeight, {
    double w = 40,
    double h = 30,
    Color? color,
    String? fontFamily,
  }) => PlateLabel(
    text: text,
    box: PlateBox(cx - w / 2, cy - h / 2, w, h),
    glyphHeight: glyphHeight,
    color: color,
    fontFamily: fontFamily,
  );

  /// `NN NNNNN`, black or maroon by theme.
  static final PlateSpec transitional = () {
    return PlateSpec(
      id: 'sy.transitional',
      country: SyriaCountry.syria,
      canvasWidth: _Transitional.width,
      canvasHeight: _Transitional.height,
      noPanel: true,
      panel: _noPanel,
      background: const PlateSection.columns(<PlatePart>[
        PlatePart(PlateSection.plain, end: _Transitional.flagLeft),
        PlatePart(
          PlateSection.rows(<PlatePart>[
            PlatePart(PlateSection.plain, end: _Transitional.flagTop),
            PlatePart(
              PlateSection.fill(PlateFill.color(SyriaColors.flagGreen)),
              end: _Transitional.flagTop + _Transitional.stripe,
            ),
            PlatePart(
              PlateSection.fill(PlateFill.color(SyriaColors.white)),
              end: _Transitional.flagTop + 2 * _Transitional.stripe,
            ),
            PlatePart(
              PlateSection.fill(PlateFill.color(SyriaColors.black)),
              end: _Transitional.flagTop + 3 * _Transitional.stripe,
            ),
            PlatePart(PlateSection.plain),
          ]),
          end: _Transitional.flagRight,
        ),
        PlatePart(PlateSection.plain),
      ]),
      slots: <PlateSlot>[
        _run(
          SyriaAlphabets.digits,
          2,
          _Transitional.codeLeft,
          0,
          _Transitional.pitch,
          _Transitional.height,
        ),
        _run(
          SyriaAlphabets.digits,
          5,
          _Transitional.serialLeft,
          0,
          _Transitional.pitch,
          _Transitional.height,
        ),
      ],
      labels: <PlateLabel>[
        _label(
          'سورية',
          _Transitional.captionX,
          22,
          29,
          w: 50,
          color: SyriaColors.black,
        ),
        _label(
          '★ ★ ★',
          _Transitional.captionX,
          _Transitional.flagTop + 1.5 * _Transitional.stripe,
          16.5,
          w: 50,
          h: _Transitional.stripe,
          color: SyriaColors.flagRed,
        ),
        _label(
          'SYR',
          _Transitional.captionX,
          83.3,
          28,
          w: 50,
          color: SyriaColors.black,
        ),
      ],
      textGroups: const <PlateTextGroup>[
        PlateTextGroup(<int>[0], key: 'code'),
        PlateTextGroup(<int>[1], key: 'serial'),
      ],
    );
  }();

  static List<PlateLabel> _stack(double x, String a, String b, String c) =>
      <PlateLabel>[
        _label(a, x, 17.25, 45, w: 46),
        b == _Aanes.sun
            ? _label(b, x, 55, 66, w: 46)
            : _label(b, x, 58.25, 45, w: 46),
        _label(c, x, 99.25, 45, w: 46),
      ];

  static PlateSpec _aanesSpec(AanesRegion r) {
    final spaced = r.code.split('').join(' ');
    final region = r.isTrilingual
        ? const PlateSection.rows(<PlatePart>[
            PlatePart(PlateSection.plain, end: 41.25, divider: _Aanes.rule),
            PlatePart(PlateSection.plain, end: 78.25, divider: _Aanes.rule),
            PlatePart(PlateSection.plain),
          ])
        : const PlateSection.rows(<PlatePart>[
            PlatePart(
              PlateSection.plain,
              end: _Aanes.midline,
              divider: _Aanes.rule,
            ),
            PlatePart(PlateSection.plain),
          ]);
    return PlateSpec(
      id: 'sy.aanes.${r.id}',
      country: SyriaCountry.syria,
      canvasWidth: _Aanes.width,
      canvasHeight: _Aanes.height,
      noPanel: true,
      panel: _noPanel,
      background: PlateSection.columns(<PlatePart>[
        PlatePart(region, end: _Aanes.regionEnd, divider: _Aanes.rule),
        const PlatePart(
          PlateSection.plain,
          end: _Aanes.syrEnd,
          divider: _Aanes.rule,
        ),
        const PlatePart(
          PlateSection.plain,
          end: _Aanes.bsEnd,
          divider: _Aanes.rule,
        ),
        const PlatePart(
          PlateSection.rows(<PlatePart>[
            PlatePart(
              PlateSection.plain,
              end: _Aanes.midline,
              divider: _Aanes.rule,
            ),
            PlatePart(PlateSection.plain),
          ]),
        ),
      ]),
      slots: <PlateSlot>[
        _run(SyriaAlphabets.digits, 6, _Aanes.digitLeft, 0, _Aanes.pitch, 61),
      ],
      mirrors: const <PlateMirror>[
        PlateMirror(
          source: 0,
          box: PlateBox(_Aanes.digitLeft, 58.7, 6 * _Aanes.pitch, 59),
          glyphHeight: 70,
          alphabet: SyriaAlphabets.easternDigits,
        ),
      ],
      labels: <PlateLabel>[
        ..._stack(_Aanes.syrX, 'S', 'Y', 'R'),
        ..._stack(_Aanes.bsX, 'B', _Aanes.sun, 'S'),
        if (r.isTrilingual) ...<PlateLabel>[
          _label(spaced, _Aanes.regionX, 19.75, 45, w: 190, h: 36),
          _label(
            r.syriac!,
            _Aanes.regionX,
            60,
            36,
            w: 190,
            h: 34,
            fontFamily: syriacFont,
          ),
          _label(r.arabic, _Aanes.regionX, 98.5, 40, w: 190, h: 38),
        ] else ...<PlateLabel>[
          _label(spaced, _Aanes.regionX, 32, 80, w: 190, h: 56),
          _label(r.arabic, _Aanes.regionX, 89.5, 72, w: 190, h: 58),
        ],
      ],
      textGroups: const <PlateTextGroup>[
        PlateTextGroup(<int>[0], key: 'serial'),
      ],
    );
  }

  static PlateSpec _motoSpec(AanesRegion r) {
    return PlateSpec(
      id: 'sy.aanes.motorcycle.${r.id}',
      country: SyriaCountry.syria,
      canvasWidth: _Moto.width,
      canvasHeight: _Moto.height,
      noPanel: true,
      panel: _noPanel,
      background: const PlateSection.columns(<PlatePart>[
        PlatePart(
          PlateSection.plain,
          end: _Moto.columnEnd,
          divider: _Aanes.rule,
        ),
        PlatePart(
          PlateSection.rows(<PlatePart>[
            PlatePart(
              PlateSection.plain,
              end: _Aanes.midline,
              divider: _Aanes.rule,
            ),
            PlatePart(PlateSection.plain),
          ]),
        ),
      ]),
      slots: <PlateSlot>[
        const PlateSlot(
          alphabet: SyriaAlphabets.letters,
          box: PlateBox(71, 69.5, 34, 43),
        ),
        _run(SyriaAlphabets.digits, 4, 108.6, 62, _Moto.pitch, 58),
      ],
      labels: <PlateLabel>[
        ..._stack(_Moto.bsX, 'B', _Aanes.sun, 'S'),
        _label(r.code, 101, 31.25, 43, w: 90, h: 40),
        _label(r.arabic, 208.5, 31.25, 34, w: 96, h: 40),
      ],
      textGroups: const <PlateTextGroup>[
        PlateTextGroup(<int>[0], key: 'letter'),
        PlateTextGroup(<int>[1], key: 'serial'),
      ],
    );
  }

  /// One AANES car spec per region, built once.
  static final Map<AanesRegion, PlateSpec> aanesByRegion =
      <AanesRegion, PlateSpec>{
        for (final r in AanesRegion.values) r: _aanesSpec(r),
      };

  static final Map<AanesRegion, PlateSpec> motorcycleByRegion =
      <AanesRegion, PlateSpec>{
        for (final r in AanesRegion.values) r: _motoSpec(r),
      };

  static PlateSpec aanes(AanesRegion region) => aanesByRegion[region]!;
  static PlateSpec motorcycle(AanesRegion region) =>
      motorcycleByRegion[region]!;

  static List<PlateSpec> get all => <PlateSpec>[
    transitional,
    ...aanesByRegion.values,
    ...motorcycleByRegion.values,
  ];
}
