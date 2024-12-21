import 'package:core/core.dart';

class LoginController extends GetxController {
  late String name;

  LoginController() : super() {
    name = 'LoginController';
  }

  @override
  void onInit() {
    super.onInit();
    Log.info('Init $name');
  }

  void login(String username, String password) {
    AppRoute.get.toNamed(AppRoute.access.login);
  }

  void logout() {
    Log.info('Logout');
  }
}
