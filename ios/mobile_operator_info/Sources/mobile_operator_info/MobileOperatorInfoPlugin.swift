import Flutter
import UIKit
import CoreTelephony

public class MobileOperatorInfoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "mobile_operator_info", binaryMessenger: registrar.messenger())
    let instance = MobileOperatorInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getMobileOperatorInfo":
      result(getMobileOperatorInfo())
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func getMobileOperatorInfo() -> [String: String?] {
      let networkInfo = CTTelephonyNetworkInfo()

      guard let firstProvider = networkInfo.serviceSubscriberCellularProviders?.values.first else {
          return [:]
      }

      return [
          "networkOperatorName": firstProvider.carrierName,
          "mobileCountryCode": firstProvider.mobileCountryCode,
          "mobileNetworkCode": firstProvider.mobileNetworkCode
      ]
  }
}
