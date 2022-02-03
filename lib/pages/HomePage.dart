import 'dart:math';

import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter/material.dart';
import 'package:gamificacion/pages/tests/Questions.dart';
import 'package:gamificacion/pages/tests/FillWord.dart';
import 'package:gamificacion/pages/tests/ResultPage.dart';
import 'package:gamificacion/pages/tests/TimeTrial.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      initialRoute: '/',
      routes: {
        '/': (context) => _grid(context),
        '/questions': (context) => const Questions(),
        '/time-trial': (context) => const TimeTrial(),
        '/fill-words': (context) => const FillWord(),
      },
      color: Colors.white,
    );
  }

  Widget _grid(BuildContext context) {
    List<Widget> options = _optionCards(context);

    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 5,
      mainAxisSpacing: 0,
      crossAxisCount: 2,
      childAspectRatio: 1 / 2.3,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          child: options[0],
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: options[1],
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: options[2],
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: options[3],
        ),
      ],
    );
  }

  List<Widget> _optionCards(BuildContext context) {
    List<Widget> cardList = [];

    List<IconData> icons = [
      Icons.text_snippet,
      Icons.access_alarm,
      Icons.text_format_outlined,
      Icons.app_settings_alt
    ];

    List<String> pages = [
      '/questions',
      '/time-trial',
      '/fill-words',
      '/questions',
    ];

    List<String> labels = [
      'Preguntas',
      'Contrarreloj',
      'Completar',
      'Configuracion',
    ];

    int itemCount = 4;
    for (int i = 0; i < itemCount; i++) {
      cardList.add(
        GestureDetector(
          onTap: () => {
            Navigator.pushNamed(context, pages[i]),
          },
          child: Card(
            color: Colors.orange,
            elevation: 5.0,
            child: Center(
              child: Column(
                children: <Widget>[
                  Icon(
                    icons[i],
                    color: Colors.white,
                    size: 100,
                  ),
                  Text(
                    labels[i],
                    style: const TextStyle(fontFamily: 'RobotoMono'),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
        ),
      );
    }
    return cardList;
  }
}
