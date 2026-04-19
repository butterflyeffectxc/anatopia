class Quiz {
  final String image;
  final String question;
  final List<String> options;
  final String correctAnswer;
  final String hint;

  Quiz({
    required this.image,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.hint,
  });
}
