import 'package:flutter/services.dart';
import 'package:mobile_operator_info/src/models/mobile_operator_info_data.dart';

class MobileOperatorInfo {
  static const MethodChannel _channel = MethodChannel('mobile_operator_info');

  Future<MobileOperatorInfoData> getMobileOperatorInfo() async {
    try {
      final result = await _channel.invokeMethod('getMobileOperatorInfo');

      if (result is Map) {
        return MobileOperatorInfoData.fromMap(result.map((key, value) => MapEntry(key.toString(), value)));
      }

      return MobileOperatorInfoData();
    } catch (error) {
      return MobileOperatorInfoData();
    }
  }
}
