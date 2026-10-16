import 'package:plate_core/plate_core.dart';

import 'syria_colors.dart';

/// No plate has a country block (the flag and "SYR" are drawn by the specs),
/// so every spec sets `noPanel`; this exists because a spec needs a country.
abstract final class SyriaCountry {
  static const PlateCountry syria = PlateCountry(
    code: 'sy',
    captionLines: <String>[],
    panelColor: SyriaColors.white,
    panelTextColor: SyriaColors.black,
  );
}
