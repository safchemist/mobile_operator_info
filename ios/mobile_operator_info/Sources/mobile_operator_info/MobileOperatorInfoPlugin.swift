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

      if #available(iOS 12.0, *) {
          guard let providers = networkInfo.serviceSubscriberCellularProviders else {
              return [:]
          }

          if let firstProvider = providers.values.first {
              return [
                  "networkOperatorName": firstProvider.carrierName,
                  "mobileCountryCode": firstProvider.mobileCountryCode,
                  "mobileNetworkCode": firstProvider.mobileNetworkCode
              ]
          } else {
              return [:]
          }
      } else {
          if let carrier = networkInfo.subscriberCellularProvider {
              return [
                  "networkOperatorName": carrier.carrierName,
                  "mobileCountryCode": carrier.mobileCountryCode,
                  "mobileNetworkCode": carrier.mobileNetworkCode
              ]
          } else {
              return [:]
          }
      }
  }
}
