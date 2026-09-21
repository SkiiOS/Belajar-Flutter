import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String Hint;
  final TextEditingController txtController;
  final bool obscureText;
  const CustomTextfield({
    super.key,
    required this.Hint,
    required this.txtController,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtController,
      obscureText: obscureText,
      decoration: InputDecoration(
        hint: Text(Hint),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
