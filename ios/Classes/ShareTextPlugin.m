#import "ShareTextPlugin.h"
#if __has_include(<share_text/share_text-Swift.h>)
#import <share_text/share_text-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "share_text-Swift.h"
#endif

@implementation ShareTextPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftShareTextPlugin registerWithRegistrar:registrar];
}
@end
