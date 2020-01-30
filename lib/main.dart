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
  final _questions = [
    {
      'question': 'what\'s your fav color',
      'answer': [{'text':'R', 'score':10}, {'text':'G', 'score':5}, {'text':'B', 'score':3}, {'text':'V', 'score':1}],
    },
    {
      'question': 'what\'s your fav book',
      'answer': [{'text':'A', 'score':10}, {'text':'B', 'score':5}, {'text':'V', 'score':3}, {'text':'D', 'score':1}],
    },
    {
      'question': 'what\'s your fav animal',
      'answer': [{'text':'T', 'score':10}, {'text':'E', 'score':5}, {'text':'S', 'score':3}, {'text':'R', 'score':1}],
    },
    {
      'question': 'who is your actor',
      'answer': [{'text':'A', 'score':10}, {'text':'N', 'score':5}, {'text':'P', 'score':3}, {'text':'Y', 'score':1}],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
          _questionIndex = 0;
    _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore+= score;
    setState(() {
      _questionIndex++;
    });
    print('Answer is chosen');
  }

  @override
  Widget build(BuildContext context) {
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
