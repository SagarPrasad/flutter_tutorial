import 'package:flutter/material.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  var questionIndex = 0;
  void answerQuestion() {
    questionIndex++;
    print('Answer is chosen');
  }

  @override
  Widget build(BuildContext context) {
    var questions = ['This is first question', 'This is second question'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sagar\'s First App'),
        ),
        body: Column(
          children: [
            Text(questions[questionIndex]),
            RaisedButton(
              child: Text('Ans1'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Ans2'),
              onPressed: () => {
                print('Ans2 is chosen !')
              }),
            RaisedButton(
              child: Text('Ans3'),
              onPressed: answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
