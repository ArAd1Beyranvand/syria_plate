import 'package:plate_core/plate_core.dart';

import 'syria_colors.dart';

/// No current Syrian plate has a country block: the transitional plate prints
/// its flag in the gap between the number groups, the AANES plate prints
/// "SYR" as a column of its own. Both are drawn by the specs, so every spec
/// sets `noPanel` and this exists only because a spec needs a country.
abstract final class SyriaCountry {
  static const PlateCountry syria = PlateCountry(
    code: 'sy',
    captionLines: <String>[],
    panelColor: SyriaColors.white,
    panelTextColor: SyriaColors.black,
  );
}
