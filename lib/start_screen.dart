import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  final void Function() startQuiz;
  const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 1,
            child: Image.asset(
              "assets/images/logo.jpeg",
              width: 200,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            "Learn flutter the fun way!",
            style: GoogleFonts.lato(
                textStyle: const TextStyle(color: Colors.white, fontSize: 24)),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text("Start New Quiz"),
            icon: const Icon(Icons.arrow_forward),
          )
        ],
      ),
    );
  }
}
