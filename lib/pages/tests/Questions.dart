import 'package:flutter/material.dart';
import 'package:conditional_questions/conditional_questions.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  String get title => 'Questions';

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final _key = GlobalKey<QuestionFormState>();

  Widget getSurvey() {
    return Scaffold(
      body: ConditionalQuestions(
        key: _key,
        children: getQuestions(),
        trailing: [
          MaterialButton(
            color: Colors.deepOrange,
            splashColor: Colors.deepOrangeAccent,
            onPressed: () async {
              if (_key.currentState!.validate()) {
                Navigator.pushNamed(context, '/');
              }
            },
            child: const Text('Enviar'),
          ),
        ],
        leading: const [
          Text('TITLE'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Questions Page',
      home: getSurvey(),
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text(widget.title),
    );
  }

  List<Question> getQuestions() {
    return [
      PolarQuestion(
        question: 'A que hace referencia la palabra providad',
        answers: ['respuesta1', 'respuesta2', 'respuesta3', 'respuesta4'],
        isMandatory: true,
      ),
      Question(
        question: "What is your name?",
        //isMandatory: true,
        validate: (field) {
          if (field.isEmpty) return "Field cannot be empty";
          return null;
        },
      ),
      PolarQuestion(
          question: "Have you made any donations in the past?",
          answers: ["Yes", "No"],
          isMandatory: true),
      PolarQuestion(
          question: "In the last 3 months have you had a vaccination?",
          answers: ["Yes", "No"]),
      PolarQuestion(
          question: "Have you ever taken medication for HIV?",
          answers: ["Yes", "No"]),
      NestedQuestion(
        question: "The series will depend on your answer",
        answers: ["Yes", "No"],
        children: {
          'Yes': [
            PolarQuestion(
                question: "Have you ever taken medication for H1n1?",
                answers: ["Yes", "No"]),
            PolarQuestion(
                question: "Have you ever taken medication for Rabies?",
                answers: ["Yes", "No"]),
            Question(
              question: "Comments",
            ),
          ],
          'No': [
            NestedQuestion(
                question: "Have you sustained any injuries?",
                answers: [
                  "Yes",
                  "No"
                ],
                children: {
                  'Yes': [
                    PolarQuestion(
                        question: "Did it result in a disability?",
                        answers: ["Yes", "No", "I prefer not to say"]),
                  ],
                  'No': [
                    PolarQuestion(
                        question:
                            "Have you ever been infected with chicken pox?",
                        answers: ["Yes", "No"]),
                  ]
                }),
          ],
        },
      )
    ];
  }
}
