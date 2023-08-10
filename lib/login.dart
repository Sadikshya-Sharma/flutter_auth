import 'package:flutter/material.dart';
import 'package:flutter_auth/loginController.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.emailController.value,
              decoration: InputDecoration(
                hintText: 'email',
              ),
            ),
            TextFormField(
              controller: controller.passwordController.value,
              decoration: InputDecoration(
                hintText: 'password',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                controller.loginApi();
              },
              child: Container(
                height: 45,
                color: Colors.green,
                child: Center(
                  child: Text('Login'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
