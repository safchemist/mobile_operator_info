import 'package:mobile_operator_info/src/mobile_operator_info_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class MobileOperatorInfoPlatform extends PlatformInterface {
  MobileOperatorInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static MobileOperatorInfoPlatform _instance = MethodChannelMobileOperatorInfo();

  static MobileOperatorInfoPlatform get instance => _instance;

  static set instance(MobileOperatorInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Map<String, String?>> getMobileOperatorInfo() {
    throw UnimplementedError('getMobileOperatorInfo() has not been implemented.');
  }
}
