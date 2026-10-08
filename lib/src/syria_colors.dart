import 'package:flutter/widgets.dart';

/// Every colour a current Syrian plate is printed in, sampled as the modal
/// pixel of the Wikimedia artwork (`Syria_License_Plate_(2025-).png`,
/// `2024-present_Syrian_Commerical_Number_Plate.png`, and the six
/// `AANES_license_plate_-_*.png`). Colours go into `SyriaThemes`, never into
/// specs — except the flag's, which do not follow the livery.
abstract final class SyriaColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  /// Ink and frame of the transitional commercial plate. A maroon, not the red
  /// the AANES commercial plate uses.
  static const Color maroon = Color(0xFF720000);

  /// The flag's top stripe.
  static const Color flagGreen = Color(0xFF007A3D);

  /// The flag's three stars.
  static const Color flagRed = Color(0xFFCE1126);

  /// AANES private ink, and the security plate's field.
  static const Color aanesBlue = Color(0xFF004080);

  /// AANES commercial ink.
  static const Color aanesRed = Color(0xFFCB2516);

  /// AANES commercial frame and rules — a hair more orange than its ink, and
  /// sampled as a distinct value on every rule in the artwork.
  static const Color aanesRedRule = Color(0xFFCC2200);

  /// AANES administrative field.
  static const Color aanesGreen = Color(0xFF006633);

  static const Color inactiveOnLight = Color(0x66666666);
  static const Color inactiveOnDark = Color(0x66FFFFFF);
  static const Color alert = Color(0xFFD32F2F);
}
