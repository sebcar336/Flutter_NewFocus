import 'package:flutter/material.dart';
import 'package:new_focus_/styles/palleta.dart';

class LoginField extends StatefulWidget {
  final String hintText;
  const LoginField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 225,
      ),
      child: TextFormField(
        style: const TextStyle(color: Pallete.text),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Pallete.borderColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Pallete.customColor1,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Pallete.borderColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
