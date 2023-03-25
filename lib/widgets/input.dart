// Flutter
import 'package:flutter/material.dart';
// Constants
import 'package:test_cryplon_flutter/constants/palette.dart';

class Input extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;
  final void Function(String)? onChanged;

  const Input({
    Key? key,
    required this.icon,
    required this.placeholder,
    required this.textController,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.01),
              offset: const Offset(0, 4),
              blurRadius: 4,
            )
          ]),
      child: TextField(
        autocorrect: false,
        keyboardType: keyboardType,
        controller: textController,
        onChanged: onChanged,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Palette.primary,
          ),
          border: InputBorder.none,
          hintText: placeholder,
        ),
      ),
    );
  }
}
