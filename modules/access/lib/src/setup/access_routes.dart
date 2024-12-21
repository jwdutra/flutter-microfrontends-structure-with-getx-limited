import 'package:core/core.dart';

import '../login/login_view.dart';

class AccessRoutes {
  final String login = '/access/login';
  final String register = '/access/register';
  final String forgotPassword = 'access/recover-password';

  List<GetPage> setup() {
    return [
      GetPage(name: login, page: () => LoginView()),
    ];
  }
}
