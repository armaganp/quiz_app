import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _qBank = [
    Question(q: 'adim mehmet', a: false),
    Question(q: '39 yasindayim', a: true),
    Question(q: 'Taksicilik yaparim', a: true),
    Question(q: 'Demirciler koyunde dogdum ', a: true),
    Question(q: 'aslen konyaliyim', a: false),
    Question(q: '2 x 3 = 7', a: false),
    Question(q: 'End ', a: false)
  ];

  String getQuestionText() {
    return _qBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _qBank[_questionNumber].questionAnswer;
  }

  bool isHaveMoreQuestion() {
    _questionNumber++;
    if (_questionNumber == _qBank.length) {
      _questionNumber = 0;
      return false;
    }
    return true;
  }
}
