FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Syria to view examples:

https://platexample.ir/#/discover/syria:flutter

# syria_plate

Syria's current licence plates for plate_core: the transitional government plate and the AANES trilingual, bilingual and motorcycle plates, with themes and a validator.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/syria_plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/syria:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/syria_plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/syria:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/syria_plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/syria:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/syria_plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/syria:typescript) |

## Quick start

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  syria_plate: ^0.1.0
```

### Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:syria_plate/syria_plate.dart';

PlateCanvas(
  spec: SyriaPlates.transitional,
  theme: SyriaThemes.private,
  validator: const SyriaTransitionalValidator(),
  autoValidate: true,
  onChooseCharacter: noCharacterChooser,
);
```

## Specs

Each spec is one plate layout.

- `SyriaPlates.transitional` — id `sy.transitional`
- `SyriaPlates.aanes`(…)
- `SyriaPlates.motorcycle`(…)

## Themes

- `SyriaThemes.private`
- `SyriaThemes.commercial`
- `SyriaThemes.aanesPrivate`
- `SyriaThemes.aanesCommercial`
- `SyriaThemes.aanesSecurity`
- `SyriaThemes.aanesAdministrative`

## Change it

`PlateCanvas` takes `spec:` (an entry of `SyriaPlates`) and `theme:` (an entry of `SyriaThemes`). Set `validator:` to `SyriaTransitionalValidator()` and `autoValidate: true` to show validation hints.

## Also included

- `SyriaCountry` — the country panel.
- `SyriaTransitionalValidator` — the plate validator.
- `SyriaRegions` — code table.

## Plates

Historical series (1997, opposition-held territories) are not built.

Colour is not on any spec: `transitional` takes `SyriaThemes.private` or
`commercial`; an `aanes` plate one of the four `SyriaThemes.aanes*`.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/syria_plate/blob/main/LICENSE).
