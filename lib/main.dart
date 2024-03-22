import 'package:flutter/material.dart';
import 'package:net_ninja_course/quiz.dart';

void main() {
  runApp(const QuizHomePage());
}

class QuizHomePage extends StatelessWidget {
  const QuizHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Quiz();
  }
}
