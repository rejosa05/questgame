class Era {
  final String id;
  final String title;
  final String subtitle;
  final List<Question> questions;
  final String backgroundImage;

  Era({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.questions,
    required this.backgroundImage
  });
}

enum QType { TrueFalse, MultipleChoice, Matching }

class Question {
  final String prompt;
  final QType type;
  final List<String> options;
  final dynamic answer;

  Question({
    required this.prompt,
    required this.type,
    required this.options,
    required this.answer,
  });
}
