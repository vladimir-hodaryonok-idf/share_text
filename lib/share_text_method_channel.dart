import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'share_text_platform_interface.dart';

/// An implementation of [ShareTextPlatform] that uses method channels.
class MethodChannelShareText extends ShareTextPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('share_text');

  @override
  Future<void> shareText(String message) async {
    const String invokeMethodShare = 'share_text';
    try {
      await methodChannel.invokeMethod(invokeMethodShare, message);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
