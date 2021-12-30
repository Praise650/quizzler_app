class QuestionModel {
  var question;
  var checkAnswer;

  QuestionModel({
    required String questions,
    required bool checkAnswers,
  }) {
    question = questions;
    checkAnswer = checkAnswers;
  }
}
