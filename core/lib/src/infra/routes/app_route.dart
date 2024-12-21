import 'package:access/access.dart';
import 'package:core/core.dart';
import 'package:home/home.dart';

class AppRoute {
  AppRoute();

  /// Wrapper for Get
  static final get = Get;

  /// Routes modules
  static AccessRoutes access = AccessRoutes();
  static HomeRoutes home = HomeRoutes();

  static List<GetPage> getRoutes() {
    return [
      ...access.setup(),
      ...home.setup(),
    ];
  }
}
