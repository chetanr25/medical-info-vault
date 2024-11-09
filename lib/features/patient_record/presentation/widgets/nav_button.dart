// lib/features/patient_record/presentation/widgets/nav_button.dart
import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback? onPressed;

  const NavButton({
    super.key,
    required this.text,
    this.isActive = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: TextButton(
          onPressed: onPressed ?? () {},
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey[200],
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
