import 'package:plate_core/plate_core.dart';

// TODO(py): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
// TODO(ts): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
// TODO(kt): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
/// A two-digit code and a five-digit serial; no code table is published, so
/// any two digits pass.
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

/// Six digits, printed twice.
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

/// One Latin letter and four digits.
class AanesMotorcycleValidator extends GatedPlateValidator {
  const AanesMotorcycleValidator();

  @override
  String get gateGroup => 'serial';

  static const String reasonLetter = 'A motorcycle plate starts with a letter.';
  static const String reasonSerial = 'The number is four digits.';

  // TODO(py): [H9] Python re: \d/\w match Unicode; keep explicit [0-9]/[A-Z] classes (or re.ASCII).
  // TODO(ts): [H9] same flavour as Dart; port as is, cover accept/reject in the vectors (D9).
  // TODO(kt): [H9] Regex engine differs per target (JVM/JS/Native): keep to portable syntax.
  static final RegExp _letter = RegExp(r'^[A-Z]$');

  @override
  PlateValidation judge(PlateEntry entry) => validateFields(
    letter: entry.group('letter'),
    serial: entry.group('serial'),
  );

  static PlateValidation validateFields({
    required String letter,
    required String serial,
  }) {
    if (!_letter.hasMatch(letter)) {
      return const PlateValidation.invalid(reasonLetter);
    }
    if (!isDigitsOfLength(serial, 4)) {
      return const PlateValidation.invalid(reasonSerial);
    }
    return const PlateValidation.valid();
  }
}
