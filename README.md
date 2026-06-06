# Mobile Operator Info

A Flutter plugin to fetch mobile operator information, such as the operator name, mobile country code (MCC), and mobile network code (MNC).

## Features

- **iOS**: Limited functionality due to deprecated CoreTelephony APIs. Returns placeholder data on iOS 16.4 and later.
- **Android**: Full functionality. No special permissions are required.

## Requirements

Since version 2.0.0, the iOS implementation is distributed exclusively as a
Swift Package Manager package — the CocoaPods podspec has been removed.

- **Flutter**: 3.44.0 or later, with Swift Package Manager enabled (the default).
  Projects that have disabled it (`flutter config --no-enable-swift-package-manager`)
  or integrate Flutter via add-to-app CocoaPods are not supported.
- **iOS**: 13.0 or later.

If you need CocoaPods support, stay on version 1.x.

## Platform Support

### iOS

This plugin uses the [CoreTelephony framework](https://developer.apple.com/documentation/coretelephony/ctcarrier), whose carrier-identity APIs (`CTCarrier`) Apple deprecated in iOS 16.0. Since iOS 16.4, these APIs no longer return real carrier information — only static placeholder values — and Apple provides no replacement API.

#### Known Limitations:
- On devices running iOS 16.4 or later, the carrier name, MCC, and MNC are always placeholder values (`--` / `65535`), regardless of the actual SIM or carrier.
- On older iOS versions, real values may still be returned, but this cannot be relied upon.
- On dual-SIM devices, the plugin reports the first available provider; the order is not guaranteed.

For more details, see the Apple documentation: [CoreTelephony - CTCarrier](https://developer.apple.com/documentation/coretelephony/ctcarrier).

### Android

On Android, the plugin fetches mobile operator information using platform APIs. No special permissions are required, as the plugin does not access sensitive user data.

#### Supported Data:
- Operator name (`networkOperatorName`)
- Mobile Country Code (`mobileCountryCode`)
- Mobile Network Code (`mobileNetworkCode`)

## Installation

To use this plugin, add `mobile_operator_info` as a dependency in your `pubspec.yaml`:

```yaml
dependencies:
  mobile_operator_info: ^2.0.0
```

Then run the following command to fetch the dependency:

```bash
flutter pub get
```

## Usage

Here’s an example of how to use the plugin:

```dart
import 'package:mobile_operator_info/mobile_operator_info.dart';

void main() async {
  final operatorInfo = await MobileOperatorInfo().getMobileOperatorInfo();

  print('Operator Name: \${operatorInfo.networkOperatorName}');
  print('Mobile Country Code (MCC): \${operatorInfo.mobileCountryCode}');
  print('Mobile Network Code (MNC): \${operatorInfo.mobileNetworkCode}');
}
```

## Example Output

### iOS 16.4+ (Returns Placeholder Data)
```
Operator Name: --
Mobile Country Code (MCC): 65535
Mobile Network Code (MNC): 65535
```

### Android (Returns Real Data)
```
Operator Name: MyOperator
Mobile Country Code (MCC): 310
Mobile Network Code (MNC): 260
```

## Known Issues

- On iOS 16.4 and later, the returned data is placeholder-only due to Apple's deprecation of the `CTCarrier` APIs in `CoreTelephony`; there is no replacement API for carrier identity.
- On Android, the plugin works as expected, but edge cases for certain devices or configurations may arise.

## License

This project is licensed under the [MIT License](LICENSE).
