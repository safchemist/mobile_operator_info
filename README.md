# Mobile Operator Info

A Flutter plugin to fetch mobile operator information, such as the operator name, mobile country code (MCC), and mobile network code (MNC).

## Features

- **iOS**: Limited functionality due to deprecated CoreTelephony APIs. Returns placeholder data (mocks).
- **Android**: Full functionality. No special permissions are required.

## Platform Support

### iOS

This plugin uses the [CoreTelephony framework](https://developer.apple.com/documentation/coretelephony/ctcarrier), which Apple has deprecated in recent iOS versions. As a result, the plugin returns placeholder data (mock values) when run on iOS.

#### Known Limitations:
- Information about the mobile operator, such as the carrier name, MCC, and MNC, is not reliably available on iOS.
- Placeholder data is returned instead of real operator information.

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
  mobile_operator_info: ^1.0.0
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

### iOS (Returns Mock Data)
```
Operator Name: Unknown Operator
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

- On iOS, the returned data is not real due to the deprecation of `CoreTelephony` APIs by Apple.
- On Android, the plugin works as expected, but edge cases for certain devices or configurations may arise.

## License

This project is licensed under the [MIT License](LICENSE).
