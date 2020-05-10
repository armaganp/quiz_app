import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:status_alert/status_alert.dart';

import 'quiz_brain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (quizBrain.isHaveMoreQuestion() == false) {
        StatusAlert.show(
          context,
          duration: Duration(seconds: 2),
          title: 'Test Bitti!',
          subtitle: ' ',
          configuration: IconConfiguration(icon: Icons.done),
        );
        scoreKeeper.clear();
      } else if (correctAnswer == userPickedAnswer) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
          size: 40.0,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
          size: 40.0,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: scoreKeeper,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'Dogru',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'Yanlis',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
      ],
    );
  }
}
