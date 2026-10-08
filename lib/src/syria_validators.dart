import 'package:plate_core/plate_core.dart';

/// Judges a transitional-government plate: a two-digit code and a five-digit
/// serial. The article publishes no code table, so any two digits pass.
class SyriaTransitionalValidator extends GatedPlateValidator {
  const SyriaTransitionalValidator();

  @override
  String get gateGroup => 'serial';

  static const String reasonCode = 'The code is two digits.';
  static const String reasonSerial = 'The serial is five digits.';

  @override
  PlateValidation judge(PlateEntry entry) =>
      validateFields(code: entry.group('code'), serial: entry.group('serial'));

  static PlateValidation validateFields({
    required String code,
    required String serial,
  }) {
    if (!isDigitsOfLength(code, 2)) {
      return const PlateValidation.invalid(reasonCode);
    }
    if (!isDigitsOfLength(serial, 5)) {
      return const PlateValidation.invalid(reasonSerial);
    }
    return const PlateValidation.valid();
  }
}

/// Judges an AANES car plate: six digits, printed twice.
class AanesValidator extends GatedPlateValidator {
  const AanesValidator();

  @override
  String get gateGroup => 'serial';

  static const String reasonSerial = 'The number is six digits.';

  @override
  PlateValidation judge(PlateEntry entry) =>
      validateFields(serial: entry.group('serial'));

  static PlateValidation validateFields({required String serial}) =>
      isDigitsOfLength(serial, 6)
      ? const PlateValidation.valid()
      : const PlateValidation.invalid(reasonSerial);
}

/// Judges an AANES motorcycle plate: one Latin letter and four digits.
class AanesMotorcycleValidator extends GatedPlateValidator {
  const AanesMotorcycleValidator();

  @override
  String get gateGroup => 'serial';

  static const String reasonLetter = 'A motorcycle plate starts with a letter.';
  static const String reasonSerial = 'The number is four digits.';

  @override
  PlateValidation judge(PlateEntry entry) => validateFields(
    letter: entry.group('letter'),
    serial: entry.group('serial'),
  );

  static PlateValidation validateFields({
    required String letter,
    required String serial,
  }) {
    if (!RegExp(r'^[A-Z]$').hasMatch(letter)) {
      return const PlateValidation.invalid(reasonLetter);
    }
    if (!isDigitsOfLength(serial, 4)) {
      return const PlateValidation.invalid(reasonSerial);
    }
    return const PlateValidation.valid();
  }
}
