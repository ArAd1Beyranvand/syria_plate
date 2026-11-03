FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Syria to view examples:

https://platexample.ir/#/discover/syria:kotlin

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

### Install (Kotlin)

Copy `kotlin/src/commonMain/kotlin/plates/countries/syria/` into `plate_core/kotlin/src/commonMain/kotlin/plates/countries/`.

Then run the tests from `plate_core/kotlin/`: `./gradlew jvmTest`.

### Use

```kotlin
import plates.countries.syria.country

val spec = country.specs["sy.transitional"]
println(country.pkg)
```

## Specs

The specs are the same in every language (they come from shared data).

- `sy.transitional`
- `sy.aanes.qamishli`
- `sy.aanes.hasaka`
- `sy.aanes.tabqa`
- `sy.aanes.kobani`
- `sy.aanes.motorcycle.qamishli`

## Themes

- `SyriaThemes.private`
- `SyriaThemes.commercial`
- `SyriaThemes.aanesPrivate`
- `SyriaThemes.aanesCommercial`
- `SyriaThemes.aanesSecurity`
- `SyriaThemes.aanesAdministrative`

## Change it

- Specs: `country.specs`, by id.
- Themes: `country.themes`.
- Validators: `country.validators` (`SyriaTransitionalValidator`, `AanesValidator`, `AanesMotorcycleValidator`).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/syria_plate/blob/main/LICENSE).
