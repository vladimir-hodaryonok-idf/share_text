import Cocoa
import FlutterMacOS

public class ShareTextPlugin: NSObject, FlutterPlugin, NSSharingServicePickerDelegate {
    private var registrar: FlutterPluginRegistrar
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "share_text", binaryMessenger: registrar.messenger)
        let instance = ShareTextPlugin(registrar: registrar)
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    init(registrar: FlutterPluginRegistrar) {
        self.registrar = registrar
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if(call.method == "share_text"){
            let args = call.arguments as! [String: Any]
            let origin = originRect(args)
            let text = args["text"] as! String
            shareItems([text], origin: origin, view: registrar.view!)
            result(true)
        }
        result(FlutterMethodNotImplemented)
    }
    private func originRect(_ args: [String: Any]) -> NSRect {
        let x = CGFloat(args["originX"] as? Double ?? 0)
        let y = CGFloat(args["originY"] as? Double ?? 0)
        let width = CGFloat(args["originWidth"] as? Double ?? 0)
        let height = CGFloat(args["originHeight"] as? Double ?? 0)
        return NSMakeRect(x, y, width, height)
    }
    private func shareItems(_ items: [Any], origin: NSRect, view: NSView, callback: FlutterResult? = nil) {
        DispatchQueue.main.async {
            let picker = NSSharingServicePicker(items: items)
            picker.delegate = self
            
            picker.show(relativeTo: origin, of: view, preferredEdge: NSRectEdge.maxY)
        }
    }
}
