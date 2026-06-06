## [3.0.0] - 2026-06-06
### Breaking
- iOS: removed the native iOS implementation entirely. Apple deprecated the
  CoreTelephony `CTCarrier` APIs in iOS 16.0 and they return only placeholder
  values since iOS 16.4, with no replacement API. The plugin is now a no-op on
  iOS (and any non-Android platform): `getMobileOperatorInfo()` returns an
  empty `MobileOperatorInfoData` with all fields `null`. Android is unaffected.

## [2.0.0] - 2026-06-06
### Breaking
- iOS: migrated from CocoaPods to Swift Package Manager. The podspec has been
  removed, so the plugin now requires Flutter 3.44.0 or later with Swift
  Package Manager enabled (the default). Projects that have disabled Swift
  Package Manager or integrate via add-to-app CocoaPods are no longer supported.
- iOS: minimum deployment target raised from 12.0 to 13.0 (the Flutter 3.44 minimum).

## [1.0.1] - 2025-01-29
### Updated
- Upgraded Gradle Plugin (AGP) to version 8.5.1.
- Updated Kotlin to version 2.1.0.
- Set Java compatibility to version 17.

## 1.0.0
- Initial release.
