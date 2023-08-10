import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  void loginApi() async {
    try {
      final response =
          await post(Uri.parse("http://192.168.1.79:3000/api/login"), body: {
        'email': emailController.value.text,
        'password': passwordController.value.text
      });

      var data = jsonDecode(response.body);

      print(response.statusCode);
      print(data);

      if (response.statusCode == 200) {
        Get.snackbar('Login Sucessful', data['message']);
      } else {
        Get.snackbar('Login FAiled', data['error']);
      }
      ;
    } catch (e) {
      Get.snackbar('Exception', e.toString());
    }
  }
}

class RegisterController extends GetxController {
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  void registerApi() async {
    try {
      final response =
          await post(Uri.parse("http://192.168.1.69:3000/api/register"), body: {
        'username': nameController.value.text,
        'email': emailController.value.text,
        'password': passwordController.value.text
      });

      var data = jsonDecode(response.body);

      print(response.statusCode);
      print(data);

      if (response.statusCode == 200) {
        Get.snackbar('Registeration sucessful', 'congratulations');
      } else {
        Get.snackbar('Registration failed', 'something went wrong');
      }
    } catch (e) {
      Get.snackbar('Exception', e.toString());
    }
  }
}
