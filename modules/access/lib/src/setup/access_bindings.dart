import 'package:core/core.dart';

import '../login/login_controller.dart';

class AccessBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(),
      fenix: true,
    );
  }
}
