import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((summary) {
            return Row(
              children: [
                Text(((summary["question_index"] as int) + 1).toString()),
                Expanded(
                  child: Column(children: [
                    Text(summary["question"] as String),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(summary["user_answer"] as String),
                    Text((summary["correct_answer"] as String))
                  ]),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
