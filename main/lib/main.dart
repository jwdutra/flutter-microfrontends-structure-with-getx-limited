import 'package:core/core.dart';

import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Environment.initialize();

  /// Inicializa os bindings
  AppBindings bindings = AppBindings();
  bindings.dependencies();

  runApp(App());
}
