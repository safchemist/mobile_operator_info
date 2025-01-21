package com.safchemist.mobile_operator_info

import android.content.Context
import android.telephony.TelephonyManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MobileOperatorInfoPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext
        channel = MethodChannel(binding.binaryMessenger, "mobile_operator_info")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "getMobileOperatorInfo") {
            result.success(getOperatorInfo())
        } else {
            result.notImplemented()
        }
    }

    private fun getOperatorInfo(): Map<String, String?> {
        val telephonyManager =
            context.getSystemService(Context.TELEPHONY_SERVICE) as TelephonyManager
        val networkOperatorName = telephonyManager.networkOperatorName
        val networkOperator = telephonyManager.networkOperator

        val mobileCountryCode = networkOperator?.substring(0, 3)
        val mobileNetworkCode = networkOperator?.substring(3)

        return mapOf(
            "networkOperatorName" to networkOperatorName,
            "mobileCountryCode" to mobileCountryCode,
            "mobileNetworkCode" to mobileNetworkCode
        )
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
