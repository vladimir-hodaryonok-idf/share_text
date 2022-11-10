import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'share_text_platform_interface.dart';

const String _invokeMethodShare = 'share_text';

/// An implementation of [ShareTextPlatform] that uses method channels.
class MethodChannelShareText extends ShareTextPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('share_text');

  @override
  Future<void> shareText(String message) async {
    try {
      await methodChannel.invokeMethod(_invokeMethodShare, message);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Future<void> macShareText(String message, RenderBox? box) async {
    final params = <String, dynamic>{'text': message};
    if(box != null){
      final rect = box.localToGlobal(Offset.zero) & box.size;
      params['originX'] = rect.left;
      params['originY'] = rect.top;
      params['originWidth'] = rect.width;
      params['originHeight'] = rect.height;
    }

    try {
      await methodChannel.invokeMethod(_invokeMethodShare, params);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
