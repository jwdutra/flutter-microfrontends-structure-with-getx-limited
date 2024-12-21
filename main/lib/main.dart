import 'package:core/core.dart';

import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Environment.initialize();

  var hiveBoxPath = 'microapps';

  /// Hive init
  if (Environment.platform != 'web') {
    var appDocumentDirectory = await getApplicationDocumentsDirectory();
    hiveBoxPath = '${appDocumentDirectory.path}/microapps';
  }
  Hive.init(hiveBoxPath);

  /// Inicializa os bindings
  AppBindings bindings = AppBindings();
  bindings.dependencies();

  runApp(App());
}
