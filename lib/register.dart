import 'package:flutter/material.dart';
import 'package:flutter_auth/loginController.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterController controller = Get.put(RegisterController());

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
              controller: controller.nameController.value,
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),
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
            TextFormField(
              controller: controller.passwordController.value,
              decoration: InputDecoration(
                hintText: ' confirm password',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                controller.registerApi();
              },
              child: Container(
                height: 45,
                color: Colors.green,
                child: Center(
                  child: Text('Register'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
