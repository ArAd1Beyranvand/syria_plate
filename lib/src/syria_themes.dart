import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'syria_colors.dart';

/// One ink on one field, with frame and rules in the ink (AANES commercial
/// uses a near-identical rule red). Ratios are measured off the artwork in
/// plate units.
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

  static final PlateTheme private = _theme(
    field: SyriaColors.white,
    ink: SyriaColors.black,
    border: _transitionalBorder,
    radius: _transitionalRadius,
  );

  static final PlateTheme commercial = _theme(
    field: SyriaColors.white,
    ink: SyriaColors.maroon,
    border: _transitionalBorder,
    radius: _transitionalRadius,
  );

  static final PlateTheme aanesPrivate = _theme(
    field: SyriaColors.white,
    ink: SyriaColors.aanesBlue,
    border: _aanesBorder,
    radius: _aanesRadius,
  );

  static final PlateTheme aanesCommercial = _theme(
    field: SyriaColors.white,
    ink: SyriaColors.aanesRed,
    rule: SyriaColors.aanesRedRule,
    border: _aanesBorder,
    radius: _aanesRadius,
  );

  static final PlateTheme aanesSecurity = _theme(
    field: SyriaColors.aanesBlue,
    ink: SyriaColors.white,
    border: _aanesBorder,
    radius: _aanesRadius,
  );

  static final PlateTheme aanesAdministrative = _theme(
    field: SyriaColors.aanesGreen,
    ink: SyriaColors.white,
    border: _aanesBorder,
    radius: _aanesRadius,
  );
}
