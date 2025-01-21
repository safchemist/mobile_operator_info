/// Represents mobile operator information.
class MobileOperatorInfoData {
  final String? networkOperatorName;
  final String? mobileCountryCode;
  final String? mobileNetworkCode;

  MobileOperatorInfoData({
    this.networkOperatorName,
    this.mobileCountryCode,
    this.mobileNetworkCode,
  });

  factory MobileOperatorInfoData.fromMap(Map<String, dynamic> map) {
    return MobileOperatorInfoData(
      networkOperatorName: map['networkOperatorName'] as String?,
      mobileCountryCode: map['mobileCountryCode'] as String?,
      mobileNetworkCode: map['mobileNetworkCode'] as String?,
    );
  }

  Map<String, String?> toMap() {
    return {
      'networkOperatorName': networkOperatorName,
      'mobileCountryCode': mobileCountryCode,
      'mobileNetworkCode': mobileNetworkCode,
    };
  }

  @override
  String toString() {
    return 'MobileOperatorInfoData(networkOperatorName: $networkOperatorName, '
        'mobileCountryCode: $mobileCountryCode, '
        'mobileNetworkCode: $mobileNetworkCode)';
  }
}
