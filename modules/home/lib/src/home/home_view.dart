import 'package:core/core.dart';

import 'home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text(controller.name),
      ),
    );
  }
}
