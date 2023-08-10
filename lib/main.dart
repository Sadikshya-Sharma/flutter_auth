import 'package:flutter/material.dart';
import 'package:flutter_auth/login.dart';
import 'package:flutter_auth/profile2.dart';
import 'package:flutter_auth/profile_screen.dart';
import 'package:flutter_auth/register.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const CourseScreen(),
        home: EditProfileScreen());
  }
}
