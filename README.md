FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Syria to view examples:

https://platexample.ir/#/discover/syria

# syria_plate

Syria's current licence plates for the `plate_core` library: the transitional government's plate and the AANES plates.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  syria_plate: ^0.1.0
```

## Use

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

## Contains

- `SyriaCountry` — country panel: `syria`.
- `SyriaPlates` — 3 plate specs: `transitional`, `aanes()`, `motorcycle()`.
- `SyriaThemes` — 6 themes: `private`, `commercial`, `aanesPrivate`, `aanesCommercial`, `aanesSecurity`, `aanesAdministrative`.
- `SyriaTransitionalValidator` — advisory validator; flags the frame, never blocks a keystroke.
- `AanesValidator` — advisory validator; flags the frame, never blocks a keystroke.
- `AanesMotorcycleValidator` — advisory validator; flags the frame, never blocks a keystroke.

## Plates

Historical series (1997, opposition-held territories) are not built.

Colour is not on any spec: `transitional` takes `SyriaThemes.private` or
`commercial`; an `aanes` plate one of the four `SyriaThemes.aanes*`.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

