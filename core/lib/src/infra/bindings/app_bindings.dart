import 'package:access/access.dart';
import 'package:core/core.dart';
import 'package:home/home.dart';

class AppBindings implements Bindings {
  /// Bindings module instances
  final AccessBindings _accessBindings = AccessBindings();
  final HomeBindings _homeBindings = HomeBindings();

  /// Bingings register
  @override
  void dependencies() {
    /// Registering the Http client

    /// Module bindings
    _accessBindings.dependencies();
    _homeBindings.dependencies();
  }
}
