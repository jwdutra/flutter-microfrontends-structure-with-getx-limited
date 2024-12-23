import 'dart:io';

import 'package:flutter/foundation.dart';

class Environment {
  static String? platform;
  static String? deviceVersion;
  static String? appVersion;
  static String? deviceId;

  static String? apiKey;
  static String? apiEndpoint;

  Environment._();

  static Future<void> initialize({
    String? platform,
    String? deviceVersion,
    String? appVersion,
    String? deviceId,
    String? apiKey,
    String? apiEndpoint,
  }) async {
    Environment.platform = kIsWeb ? 'web' : Platform.operatingSystem;
    Environment.deviceVersion = deviceVersion;
    Environment.appVersion = appVersion;
    Environment.deviceId = deviceId;

    Environment.apiKey = const String.fromEnvironment('API_KEY');
    Environment.apiEndpoint = const String.fromEnvironment('API_ENDPOINT');
  }
}
