class QuizQuestion {
  QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffleAnswers() {
    final shuffledLists = List.of(answers);
    shuffledLists.shuffle();
    return shuffledLists;
  }
}
