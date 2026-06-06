# Mobile Operator Info

A Flutter plugin to fetch mobile operator information, such as the operator name, mobile country code (MCC), and mobile network code (MNC).

## Features

- **Android**: Full functionality. No special permissions are required.
- **iOS**: Not supported — `getMobileOperatorInfo()` returns empty data. Apple deprecated the relevant CoreTelephony APIs with no replacement.

## Requirements

- **Flutter**: 3.44.0 or later.

## Platform Support

### iOS

Since version 3.0.0 this plugin has no native iOS implementation. Apple deprecated the carrier-identity APIs of the [CoreTelephony framework](https://developer.apple.com/documentation/coretelephony/ctcarrier) (`CTCarrier`) in iOS 16.0, and since iOS 16.4 they return only static placeholder values (`--` / `65535`) with no replacement API. Because real operator information cannot be obtained on modern iOS, the plugin is a no-op there: `getMobileOperatorInfo()` completes successfully and returns a `MobileOperatorInfoData` with all fields set to `null`.

It is safe to call the plugin on iOS — no exception is thrown and no native code is involved.

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
  mobile_operator_info: ^3.0.0
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

### iOS (No-op, Returns Empty Data)
```
Operator Name: null
Mobile Country Code (MCC): null
Mobile Network Code (MNC): null
```

### Android (Returns Real Data)
```
Operator Name: MyOperator
Mobile Country Code (MCC): 310
Mobile Network Code (MNC): 260
```

## Known Issues

- On Android, the plugin works as expected, but edge cases for certain devices or configurations may arise.

## License

This project is licensed under the [MIT License](LICENSE).
