import 'package:flutter/material.dart';

import 'questions.dart';
import 'answers.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.answerQuestion,
    @required this.questionIndex,
    @required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['question']),
        ...((questions[questionIndex]['answer'] as List<Map<String, Object>>).toList()..shuffle()).map((ans) {
          return Answer(() => answerQuestion(ans['score']), ans['text']);
        }).toList(),
      ],
    );
  }
}
