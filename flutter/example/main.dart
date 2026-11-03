import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';
import 'package:syria_plate/syria_plate.dart';

void main() => runApp(
  PlateExampleApp(
    spec: SyriaPlates.transitional,
    theme: SyriaThemes.private,
    validator: const SyriaTransitionalValidator(),
    autoValidate: true,
  ),
);
