import 'package:flutter/material.dart';

class TextFieldDesign extends StatelessWidget {
  const TextFieldDesign({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final IconData icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: this.keyboardType,
      obscureText: this.obscureText,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        hintText: this.hintText,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(.6),
        ),
        prefixIcon: Icon(icon, color: Colors.white),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
    );
  }
}
