import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_operator_info/src/mobile_operator_info_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelMobileOperatorInfo platform = MethodChannelMobileOperatorInfo();
  const MethodChannel channel = MethodChannel('mobile_operator_info');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return <String, String?>{
          'networkOperatorName': 'name',
          'mobileCountryCode': '100',
          'mobileNetworkCode': '1',
        };
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getMobileOperatorInfo', () async {
    expect(await platform.getMobileOperatorInfo(), isNotEmpty);
  });
}
