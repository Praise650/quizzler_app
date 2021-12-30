import 'package:quizzler_app/QuestionModel/question_bank.dart';

class QuizController {
  List<QuestionModel> _question = [
    QuestionModel(
      questions:
          'Super Eagles is the name of the nigerian national men\'s football team',
      checkAnswers: true,
    ),
    QuestionModel(
      questions: 'China own one of the biggest tech factory in the world',
      checkAnswers: true,
    ),
    QuestionModel(
      questions: 'The star sign is represented by a tiger',
      checkAnswers: false,
    ),
    QuestionModel(
      questions: 'Gin is typically included in a long Island Iced Tea',
      checkAnswers: true,
    ),
    QuestionModel(
      questions: 'The unicorn is the national animal of Scotland',
      checkAnswers: true,
    ),
  ];

  String getQuestion(int questionNumber) {
    return _question[questionNumber].question;
  }

  bool checkAnswer(int questionNumber) {
    return _question[questionNumber].checkAnswer;
  }
}
