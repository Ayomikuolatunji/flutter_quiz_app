import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:net_ninja_course/data/questions.dart';
import 'package:net_ninja_course/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final void Function() handleRestartTest;

  const ResultsScreen(
      {super.key,
      required this.chosenAnswers,
      required this.handleRestartTest});

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = summaryData;
    final int numTotalQuestions = questions.length;
    final int numOfCorrectAnswers = summary.where((data) {
      return data["user_answer"] as String == data["correct_answer"] as String;
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numOfCorrectAnswers out of $numTotalQuestions questions correctly",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle:
                      const TextStyle(color: Colors.white, fontSize: 25)),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: handleRestartTest,
              icon: const Icon(Icons.restart_alt_rounded),
              label: Text(
                "Restart quiz",
                style: GoogleFonts.lato(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
