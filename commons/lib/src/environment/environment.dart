import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'auth_token.dart';

class Environment {
  static String? platform;
  static String? deviceVersion;
  static String? appVersion;
  static AuthTokenEntity? authToken;
  static String? deviceId;
  static Box? cacheBox;

  static String? apiKey;
  static String? apiEndpoint;

  Environment._();

  static Future<void> initialize({
    String? platform,
    String? deviceVersion,
    String? appVersion,
    AuthTokenEntity? authToken,
    String? deviceId,
    Box? cacheBox,
    String? apiKey,
    String? apiEndpoint,
  }) async {
    Environment.platform = kIsWeb ? 'web' : Platform.operatingSystem;
    Environment.deviceVersion = deviceVersion;
    Environment.appVersion = appVersion;
    Environment.authToken = authToken;
    Environment.deviceId = deviceId;
    Environment.cacheBox = cacheBox ?? await Hive.openBox('microapps');

    Environment.apiKey = const String.fromEnvironment('API_KEY');
    Environment.apiEndpoint = const String.fromEnvironment('API_ENDPOINT');
  }
}
