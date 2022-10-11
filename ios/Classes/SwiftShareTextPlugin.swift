import Flutter
import UIKit

public class SwiftShareTextPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "share_text", binaryMessenger: registrar.messenger())
        let instance = SwiftShareTextPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
        if call.method == "share_text"{
            let controller = UIActivityViewController(activityItems:[call.arguments as Any], applicationActivities: nil)
            let viewController = UIApplication.shared.keyWindow!.rootViewController
            viewController?.present(controller,animated: true)
        }
        else{
            result(FlutterMethodNotImplemented)
            return
        }
    }
    
}
