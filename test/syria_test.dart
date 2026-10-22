import 'package:flutter_test/flutter_test.dart';
import 'package:plate_core/plate_core.dart';
import 'package:syria_plate/syria_plate.dart';

void main() {
  test('every spec passes the debug spec check', () {
    for (final spec in SyriaPlates.all) {
      expect(debugValidateSpec(spec), isTrue, reason: spec.id);
    }
  });

  test('one AANES car and motorcycle spec per region', () {
    expect(SyriaPlates.aanesByRegion.length, AanesRegion.values.length);
    expect(SyriaPlates.motorcycleByRegion.length, AanesRegion.values.length);
    expect(SyriaPlates.aanes(AanesRegion.qamishli).mirrors.length, 1);
  });

  test('only the Jazira districts with a Syriac name are trilingual', () {
    expect(AanesRegion.values.where((r) => r.isTrilingual), <AanesRegion>[
      AanesRegion.qamishli,
      AanesRegion.hasaka,
    ]);
  });

  group('validators', () {
    test('transitional', () {
      expect(
        SyriaTransitionalValidator.validateFields(code: '12', serial: '12345').isValid,
        isTrue,
      );
      expect(
        SyriaTransitionalValidator.validateFields(code: '1', serial: '12345').isValid,
        isFalse,
      );
      expect(
        SyriaTransitionalValidator.validateFields(code: '12', serial: '1234').isValid,
        isFalse,
      );
    });

    test('AANES', () {
      expect(AanesValidator.validateFields(serial: '123456').isValid, isTrue);
      expect(AanesValidator.validateFields(serial: '12345').isValid, isFalse);
    });

    test('motorcycle', () {
      expect(AanesMotorcycleValidator.validateFields(letter: 'A', serial: '1234').isValid, isTrue);
      expect(AanesMotorcycleValidator.validateFields(letter: '1', serial: '1234').isValid, isFalse);
    });
  });
}
