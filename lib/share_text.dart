
import 'package:flutter/material.dart';

import 'share_text_platform_interface.dart';

class ShareText {
  static Future<void> shareText(String message) =>
      ShareTextPlatform.instance.shareText(message);

  static Future<void> macShareText(String message,RenderBox? box) =>
      ShareTextPlatform.instance.macShareText(message,box);
}
