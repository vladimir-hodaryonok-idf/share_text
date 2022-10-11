
import 'share_text_platform_interface.dart';

class ShareText {
  static Future<void> shareText(String message) =>
      ShareTextPlatform.instance.shareText(message);
}
