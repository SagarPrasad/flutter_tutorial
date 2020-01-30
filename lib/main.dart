import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questions = [
    {
      'question': 'what\'s your fav color',
      'answer': [
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 5},
        {'text': 'Black', 'score': 3},
        {'text': 'Voilet', 'score': 1}
      ],
    },
    {
      'question': 'what\'s your fav subject',
      'answer': [
        {'text': 'Physics', 'score': 10},
        {'text': 'Literature', 'score': 5},
        {'text': 'Maths', 'score': 3},
        {'text': 'SST', 'score': 1}
      ],
    },
    {
      'question': 'what\'s your fav animal',
      'answer': [
        {'text': 'Tiger', 'score': 10},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Snake', 'score': 3},
        {'text': 'Rat', 'score': 1}
      ],
    },
    {
      'question': 'who is your actor',
      'answer': [
        {'text': 'Abhi', 'score': 10},
        {'text': 'Shahruk', 'score': 5},
        {'text': 'Salman', 'score': 3},
        {'text': 'Aamir', 'score': 1}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questions = _questions.toList()..shuffle();
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print('Answer is chosen');
  }

  @override
  Widget build(BuildContext context) {
    print(_questions);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sagar\'s First App'),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
