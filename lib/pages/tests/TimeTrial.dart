import 'dart:math';

import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:gamificacion/pages/tests/ResultPage.dart';
import 'package:gamificacion/entities/ChallengeResult.dart';

class TimeTrial extends StatefulWidget {
  const TimeTrial({Key? key}) : super(key: key);

  @override
  State<TimeTrial> createState() => _TimeTrialState();
}

class _TimeTrialState extends State<TimeTrial> {
  final _key = GlobalKey<QuestionFormState>();
  List<int> randomIndices = [0, 1, 2, 3, 4, 5]..shuffle();
  int index = 0;
  late Question currentQuestion;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: getSurvey(),
    );
  }

  Widget getSurvey() {
    List<Question> questions = getQuestions();
    currentQuestion = questions[randomIndices[index]];

    return ConditionalQuestions(
      key: _key,
      children: [currentQuestion],
      trailing: [
        MaterialButton(
          color: Colors.deepOrange,
          splashColor: Colors.deepOrangeAccent,
          onPressed: () async {
            setState(() {
              if (index < questions.length - 1) {
                index++;
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      results: ChallengeResult(
                          'prueba', 1, 0, 'Colors.black', 'user'),
                    ),
                  ),
                );
              }
            });
          },
          child: Text('Submit'),
        ),
      ],
      leading: [
        Text(questions.length.toString()),
        countdownTimer(DateTime.now().millisecondsSinceEpoch + 1000 * 10),
      ],
    );
  }

  Widget countdownTimer(int endTime) {
    return CountdownTimer(
      endTime: endTime,
      onEnd: () => {
        setState(() => {index++})
      },
    );
  }

  List<Question> getQuestions() {
    return [
      PolarQuestion(
        question: '1',
        answers: ['respuesta1', 'respuesta2', 'respuesta3', 'respuesta4'],
        isMandatory: true,
      ),
      PolarQuestion(
        question: '2',
        answers: ['respuesta1', 'respuesta2', 'respuesta3', 'respuesta4'],
        isMandatory: true,
      ),
      PolarQuestion(
        question: '3',
        answers: ['respuesta1', 'respuesta2', 'respuesta3', 'respuesta4'],
        isMandatory: true,
      ),
      PolarQuestion(
        question: '4',
        answers: ['respuesta1', 'respuesta2', 'respuesta3', 'respuesta4'],
        isMandatory: true,
      ),
      PolarQuestion(
        question: '5',
        answers: ['respuesta1', 'respuesta2', 'respuesta3', 'respuesta4'],
        isMandatory: true,
      ),
      PolarQuestion(
        question: '6',
        answers: ['respuesta1', 'respuesta2', 'respuesta3', 'respuesta4'],
        isMandatory: true,
      ),
    ];
  }
}
