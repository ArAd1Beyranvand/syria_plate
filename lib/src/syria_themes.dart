import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'syria_colors.dart';

/// Every theme is one ink on one field, with the frame and rules in the ink
/// (or, on the AANES commercial plate, in a near-identical rule red).
///
/// The ratios are measured off the artwork in plate units: the transitional
/// frame is 4.2 of 111.4 with a 7.4 corner; the AANES frame and rules are 2 of
/// 120 with a 6 corner.
abstract final class SyriaThemes {
  static const double _transitionalBorder = 4.2 / 111.4;
  static const double _transitionalRadius = 7.4 / 111.4;
  static const double _aanesBorder = 2 / 120;
  static const double _aanesRadius = 6 / 120;

  static PlateTheme _theme({
    required Color field,
    required Color ink,
    required double border,
    required double radius,
    Color? rule,
  }) => PlateTheme(
    plateBackground: field,
    plateBorder: rule ?? ink,
    ink: ink,
    dividerColor: rule ?? ink,
    borderWidthRatio: border,
    plateRadiusRatio: radius,
    activeColor: ink,
    inactiveColor: field == SyriaColors.white
        ? SyriaColors.inactiveOnLight
        : SyriaColors.inactiveOnDark,
    alertColor: SyriaColors.alert,
  );

  /// Transitional government, private: black on white.
  static final PlateTheme private = _theme(
    field: SyriaColors.white,
    ink: SyriaColors.black,
    border: _transitionalBorder,
    radius: _transitionalRadius,
  );

  /// Transitional government, commercial: maroon on white.
  static final PlateTheme commercial = _theme(
    field: SyriaColors.white,
    ink: SyriaColors.maroon,
    border: _transitionalBorder,
    radius: _transitionalRadius,
  );

  /// AANES private: blue on white. Also the motorcycle plate.
  static final PlateTheme aanesPrivate = _theme(
    field: SyriaColors.white,
    ink: SyriaColors.aanesBlue,
    border: _aanesBorder,
    radius: _aanesRadius,
  );

  /// AANES commercial (buses, taxis, trucks): red on white.
  static final PlateTheme aanesCommercial = _theme(
    field: SyriaColors.white,
    ink: SyriaColors.aanesRed,
    rule: SyriaColors.aanesRedRule,
    border: _aanesBorder,
    radius: _aanesRadius,
  );

  /// AANES security forces (Asayish, Sutoro): white on blue.
  static final PlateTheme aanesSecurity = _theme(
    field: SyriaColors.aanesBlue,
    ink: SyriaColors.white,
    border: _aanesBorder,
    radius: _aanesRadius,
  );

  /// AANES administrative (municipal vehicles, fire engines, ambulances):
  /// white on green.
  static final PlateTheme aanesAdministrative = _theme(
    field: SyriaColors.aanesGreen,
    ink: SyriaColors.white,
    border: _aanesBorder,
    radius: _aanesRadius,
  );
}
