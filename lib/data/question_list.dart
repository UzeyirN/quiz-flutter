import '../models/questionStructure.dart';

class QuestionList {
  int _questionIndex = 0;
  final List<QuestionStructure> _questionList = [
    QuestionStructure(
      text: 'Dart programming language is used by Flutter.',
      answer: true,
    ),
    QuestionStructure(
      text:
          'setState method is called when a StatefulWidget is built for the first time.',
      answer: false,
    ),
    QuestionStructure(
      text: 'Align widget is used to add padding around another widget.',
      answer: false,
    ),
    QuestionStructure(
      text: 'ListView  widget is used to create scrollable content in Flutter.',
      answer: true,
    ),
    QuestionStructure(
      text:
          'Align widget is used to build layouts by specifying horizontal and vertical alignments?',
      answer: true,
    ),
  ];

  String getQuestionText() {
    return _questionList[_questionIndex].text;
  }

  bool getQuestionAnswers() {
    return _questionList[_questionIndex].answer;
  }

  bool isFinished() {
    if (_questionIndex + 1 >= _questionList.length) {
      return true;
    } else {
      return false;
    }
  }

  void nextQuestion() {
    if (_questionIndex < _questionList.length - 1) {
      _questionIndex++;
    }
  }

  void resetIndex() {
    _questionIndex = 0;
  }

  int getQuestionCount() {
    return _questionList.length;
  }
}
