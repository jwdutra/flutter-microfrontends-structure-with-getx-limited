import 'dart:convert';

import 'package:core/core.dart';

class Session {
  static final Session _singleton = Session._internal();

  factory Session() {
    return _singleton;
  }

  Session._internal();

  static AccessEntity? access;
  static UserEntity? user;

  static String? token;
  static String? tokenIat;
  static String? tokenExp;

  static Future<void> refreshToken(String token) async {
    //return token;
  }

  static Future<void> logout() async {
    Session.access = null;
    Session.user = null;
    Session.token = null;
    Session.tokenIat = null;
    Session.tokenExp = null;
    await Environment.cacheBox?.deleteAll(['access', 'user']);
    //Routes.route.replaceNamed(Routes.access.login);
  }

  static Future<bool> isLogued() async {
    if (Session.access == null) {
      var access = await Environment.cacheBox?.get('access');
      if (access != null) {
        Session.access = AccessEntity.fromJson(jsonDecode(access));
        var user = await Environment.cacheBox?.get('user');
        if (user != null) {
          Session.user = UserEntity.fromJson(jsonDecode(user));
        }

        if (!Session().verifyJwt(Session.access!.token, null)) {
          await logout();
          return false;
        }

        return true;
      }
      return false;
    }

    return true;
  }

  bool verifyJwt(String token, String? secretKey) {
    final parts = token.split('.');
    if (parts.length != 3) {
      //throw Exception('Token inválido');
      return false;
    }

    final header = jsonDecode(utf8.decode(base64Url.decode(parts[0])));
    if (header['alg'] != 'HS256') {
      //throw Exception('Algoritmo inválido');
      return false;
    }

    final payload =
        jsonDecode(utf8.decode(base64Url.decode(toMultipleOfFour(parts[1]))));
    Uri uri = Uri.parse(payload['iss']);
    String baseUrl = '${uri.scheme}://${uri.host}';

    if (baseUrl != Environment.apiEndpoint) {
      //throw Exception('Emissor inválido');
      return false;
    }

    Session.token = token;
    Session.tokenExp = payload['exp'].toString();
    Session.tokenIat = payload['iat'].toString();

    return true;
  }

  String toMultipleOfFour(String input) {
    while (input.length % 4 != 0) {
      input += '=';
    }
    return input;
  }
}
