import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mobile_operator_info/src/mobile_operator_info_platform_interface.dart';

class MethodChannelMobileOperatorInfo extends MobileOperatorInfoPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('mobile_operator_info');

  @override
  Future<Map<String, String?>> getMobileOperatorInfo() async {
    final result = await methodChannel.invokeMethod('getMobileOperatorInfo');

    if (result is Map) {
      return result.map((key, value) => MapEntry(key.toString(), value?.toString()));
    }

    return <String, String?>{};
  }
}
