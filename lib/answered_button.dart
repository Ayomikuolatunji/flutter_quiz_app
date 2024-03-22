import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnsweredButton extends StatelessWidget {
  const AnsweredButton({required this.answer, required this.onTap, super.key});

  final void Function() onTap;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(3),
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white),
        onPressed: onTap,
        child: Text(
          textAlign: TextAlign.center,
          answer,
          style: GoogleFonts.getFont("Lato"),
        ));
  }
}
