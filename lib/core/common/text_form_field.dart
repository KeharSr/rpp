import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;

  const MyTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(prefixIcon, color: Colors.white),
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white), // White border
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0), // Thicker white border when focused
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.red, width: 2.0), // Red border on error
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.red,
                width: 2.0), // Red border when focused and error
          ),
        ),
        // Text color inside the field
      ),
    );
  }
}
