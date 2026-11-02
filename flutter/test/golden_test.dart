import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plate_core/plate_core.dart';
import 'package:syria_plate/syria_plate.dart';

/// One golden per category, rendered with real fonts so the glyphs can be
/// measured against the Wikimedia artwork. Noto Sans Syriac is not a system
/// font here; it is picked up from the workspace's gitignored reference
/// directory when present, and the Syriac row shows boxes without it.
///
/// Regenerate with `flutter test --update-goldens`.
void main() {
  setUpAll(() async {
    final loader = FontLoader('Roboto');
    for (final path in const <String>[
      '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf',
      '/usr/share/fonts/truetype/noto/NotoSansArabic-Bold.ttf',
    ]) {
      final file = File(path);
      if (!file.existsSync()) continue;
      loader.addFont(file.readAsBytes().then((b) => ByteData.view(b.buffer)));
    }
    await loader.load();
    final syriac = File('../.plateref/fonts/NotoSansSyriac.ttf');
    if (syriac.existsSync()) {
      await (FontLoader(
            SyriaPlates.syriacFont,
          )..addFont(syriac.readAsBytes().then((b) => ByteData.view(b.buffer))))
          .load();
    }
  });

  Future<void> golden(
    WidgetTester tester,
    PlateSpec spec,
    PlateTheme theme,
    List<String?> values,
    String name,
  ) async {
    final controller = PlateController.fromValues(spec, values);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xFF808080),
          body: Center(
            child: SizedBox(
              width: 2 * spec.canvasWidth,
              height: 2 * spec.canvasHeight,
              child: PlateThemeScope(
                theme: theme,
                child: PlateView(
                  controller: controller,
                  theme: theme,
                  country: SyriaCountry.syria,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(PlateView),
      matchesGoldenFile('goldens/$name.png'),
    );
    await tester.pumpWidget(const SizedBox.shrink());
    controller.dispose();
  }

  const transitional = <String?>['12', '12345'];
  const six = <String?>['123456'];
  const moto = <String?>['A', '1234'];

  testWidgets('transitional private', (t) async {
    await golden(
      t,
      SyriaPlates.transitional,
      SyriaThemes.private,
      transitional,
      'sy_private',
    );
  });
  testWidgets('transitional commercial', (t) async {
    await golden(
      t,
      SyriaPlates.transitional,
      SyriaThemes.commercial,
      transitional,
      'sy_commercial',
    );
  });
  testWidgets('aanes private, trilingual', (t) async {
    await golden(
      t,
      SyriaPlates.aanes(AanesRegion.qamishli),
      SyriaThemes.aanesPrivate,
      six,
      'sy_aanes_private',
    );
  });
  testWidgets('aanes commercial, trilingual', (t) async {
    await golden(
      t,
      SyriaPlates.aanes(AanesRegion.hasaka),
      SyriaThemes.aanesCommercial,
      six,
      'sy_aanes_commercial',
    );
  });
  testWidgets('aanes security', (t) async {
    await golden(
      t,
      SyriaPlates.aanes(AanesRegion.qamishli),
      SyriaThemes.aanesSecurity,
      six,
      'sy_aanes_security',
    );
  });
  testWidgets('aanes administrative, trilingual', (t) async {
    await golden(
      t,
      SyriaPlates.aanes(AanesRegion.hasaka),
      SyriaThemes.aanesAdministrative,
      six,
      'sy_aanes_administrative',
    );
  });
  testWidgets('aanes administrative, bilingual', (t) async {
    await golden(
      t,
      SyriaPlates.aanes(AanesRegion.tabqa),
      SyriaThemes.aanesAdministrative,
      six,
      'sy_aanes_bilingual',
    );
  });
  testWidgets('aanes motorcycle', (t) async {
    await golden(
      t,
      SyriaPlates.motorcycle(AanesRegion.qamishli),
      SyriaThemes.aanesPrivate,
      moto,
      'sy_aanes_motorcycle',
    );
  });
}
