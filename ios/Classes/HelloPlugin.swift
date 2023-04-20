import Flutter
import UIKit

public class HelloPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "hello_plugin", binaryMessenger: registrar.messenger())
    let instance: HelloPlugin = HelloPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      case "getPlatformVersion":
        result("iOS " + UIDevice.current.systemVersion)
      case "randomNumber":
        let number = Int.random(in: 0..<100)
        result("Random number from iOS:" + number)
      default:
        result(FlutterMethodNotImplemented)
    }
  }
}
