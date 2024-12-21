import 'package:access/src/login/login_controller.dart';
import 'package:core/core.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20.0,
          children: [
            Text(controller.name),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoute.home.initial);
              },
              child: Text('Ir para a home'),
            ),
          ],
        ),
      ),
    );
  }
}
