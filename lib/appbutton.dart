import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mainbutton extends StatelessWidget {
  final Function() onTap;
  final String text;

  final Color? txtColor;
  final Color btnColor;
  const Mainbutton({
    Key? key,
    required this.onTap,
    required this.text,
    this.txtColor,
    required this.btnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Get.height * .070,
        width: Get.width * 1,
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   text,
            //   style: txtColor != null
            //       ? headline2.copyWith(color: txtColor)
            //       : headline2,
            // )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  final VoidCallback onTap;

  Color? buttonColor;

  double? borderRadius;

  Color? textColor;

  final String buttonText;

  Color? borderColor;

  AppButton({
    required this.onTap,
    this.borderRadius,
    this.buttonColor,
    this.textColor,
    this.borderColor,
    required this.buttonText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: buttonColor,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(borderRadius ?? 0)),
      child: Material(
        color: buttonColor,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(buttonText,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ),
      ),
    );
  }
}
