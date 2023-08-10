// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ReusableTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  VoidCallback? onPress;
  FormFieldValidator<String>? validator;
  final bool obscureText;
  final TextInputType? keyBoardType;
  final String? hintText;
  bool isobs = false;

  // dynamic suffixicon;

  ReusableTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    this.validator,
    this.obscureText = false,
    this.onPress,
    this.keyBoardType,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isobs,
      validator: validator,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final TextEditingController passwordcontroller = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObscure,
      keyboardType: TextInputType.emailAddress,
      controller: passwordcontroller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
            icon: _isObscure
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility)),
        labelText: 'password',
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your Password';
        }
        if (value.length < 5) {
          return 'Password should be more than 5 words';
        }
        // if (!value.contains(RegExp(r'[a-zA-Z]')) ||
        //     !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')) ||
        //     !value.contains(RegExp(r'[0-9]'))) {
        //   return 'Password must contain at least one alphabet, symbol, and number';
        // }
        return null;
      },
    );
  }
}
