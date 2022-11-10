import 'package:flutter/material.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'share_text_method_channel.dart';

abstract class ShareTextPlatform extends PlatformInterface {
  /// Constructs a ShareTextPlatform.
  ShareTextPlatform() : super(token: _token);

  static final Object _token = Object();

  static ShareTextPlatform _instance = MethodChannelShareText();

  /// The default instance of [ShareTextPlatform] to use.
  ///
  /// Defaults to [MethodChannelShareText].
  static ShareTextPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ShareTextPlatform] when
  /// they register themselves.
  static set instance(ShareTextPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> shareText(String message) async {
    throw UnimplementedError('shareText() has not been implemented.');
  }

  Future<void> macShareText(String message,RenderBox? box) async {
    throw UnimplementedError('shareText() has not been implemented.');
  }
}
