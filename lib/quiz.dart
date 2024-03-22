import 'package:flutter/material.dart';
import 'package:net_ninja_course/data/questions.dart';
import 'package:net_ninja_course/results_screen.dart';
import "package:net_ninja_course/start_screen.dart";
import 'package:net_ninja_course/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-screen";
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void onSelectAnswer(String selectedAnswer) {
    selectedAnswers.add(selectedAnswer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  void handleRestartTest() {
    setState(() {
      activeScreen = "questions-screen";
      selectedAnswers = [];
    });
  }

  void handleExitTest() {
    setState(() {
      activeScreen = "start-screen";
      selectedAnswers = [];
    });
  }

  @override
  Widget build(context) {
    return newMethod();
  }

  Widget newMethod() {
    Widget renderScreenWidget = activeScreen == "start-screen"
        ? StartScreen(switchScreen)
        : activeScreen == "results-screen"
            ? ResultsScreen(
                chosenAnswers: selectedAnswers,
                handleRestartTest: handleRestartTest)
            : QuestionsScreen(
                onSelectAnswer: onSelectAnswer, handleExitTest: handleExitTest);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("AYOSCRIPT QUIZ APP"),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168),
          ], begin: Alignment.topLeft, end: Alignment.bottomLeft)),
          child: renderScreenWidget,
        ),
      ),
    );
  }
}
