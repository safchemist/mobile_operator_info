// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mobile_operator_info/mobile_operator_info.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getMobileOperatorInfo test', (WidgetTester tester) async {
    final MobileOperatorInfo plugin = MobileOperatorInfo();
    final data = await plugin.getMobileOperatorInfo();
    expect(data.networkOperatorName, isNotEmpty);
  });
}
