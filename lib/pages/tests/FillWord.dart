import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FillWord extends StatefulWidget {
  const FillWord({Key? key}) : super(key: key);

  @override
  State<FillWord> createState() => _FillWordState();
}

class _FillWordState extends State<FillWord> {
  List<String> preguntas = [
    'Moralidad, integridad y honradez en las acciones',
    'Consideración, acompañada de cierta sumisión, con que se trata a una persona o una cosa por alguna cualidad, situación o circunstancia que las determina y que lleva a acatar lo que dice o establece o a no causarle ofensa o perjuicio',
    'Actitud humana considerada en muchas sociedades como la virtud de coordinarse cronológicamente para cumplir una tarea requerida',
    'Se refiere al comportamiento anticipatorio, orientado al cambio y autoiniciado en diversas situaciones',
    'Proceso de dos o más personas u organizaciones que trabajan juntas para completar una tarea o alcanzar una meta',
  ];

  List<String> respuestas = [
    'probidad',
    'respeto',
    'puntualidad',
    'proactividad',
    'colaboracion',
  ];

  int index = 0;
  int currentSolvingIndex = 0;
  double probabilityOfNotShowingLetter = 0.15;
  List<String> notUsedLetters = [];
  List<int> notUsedIndexes = [];
  List<String> currentStateOfWord = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        home: ListView(
          children: <Widget>[
            Container(
              color: Colors.white,
              margin: const EdgeInsets.all(10),
              child: const Text(
                'Complete la palabra en orden segun la definicion entregada',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    decoration: TextDecoration.none),
              ),
            ),
            const Divider(),
            const Divider(),
            const Divider(),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.all(2),
              child: Center(
                child: Text(
                  preguntas[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 20,
                      decoration: TextDecoration.none),
                ),
              ),
            ),
            const Divider(),
            const Divider(),
            Container(
              color: Colors.white,
              child: Center(
                child: Row(
                  children: getFillBoxes(respuestas[index]),
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
            const Divider(),
            const Divider(),
            Container(
              color: Colors.white,
              child: Center(
                child: Row(
                  children: getAnswerBoxes(10),
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getFillBoxes(String word) {
    List<Widget> wordCard = [];
    for (int i = 0; i < word.length; i++) {
      wordCard.add(getSingleLetterBox(word[i], word.length, i));
    }
    return wordCard;
  }

  List<Widget> getAnswerBoxes(int letterSize) {
    List<Widget> wordCard = [];
    notUsedLetters = notUsedLetters..shuffle();
    for (int i = 0; i < notUsedLetters.length; i++) {
      wordCard.add(GestureDetector(
        child: Card(
          color: RandomColor().getColor(),
          margin: const EdgeInsets.all(10),
          child: Center(
            heightFactor: 1,
            widthFactor: 2,
            child: Text(
              notUsedLetters[i],
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: (letterSize + 20),
                  decoration: TextDecoration.none),
            ),
          ),
        ),
        onTap: () async {
          setState(() {
            if (currentStateOfWord.any((element) => element == ' ')) {
              for (int i = 0; i < currentStateOfWord.length; i++) {
                if (currentStateOfWord[i] == ' ') {
                  currentSolvingIndex = i;
                  break;
                }
              }
              print(notUsedLetters[i]);
              if (notUsedLetters[i] == respuestas[index][currentSolvingIndex]) {
                currentStateOfWord[currentSolvingIndex] = notUsedLetters[i];
                notUsedLetters.remove(notUsedLetters[i]);
              }
            } else {
              currentSolvingIndex = 0;
              index++;
            }
          });
        },
      ));
    }
    notUsedIndexes = [];
    return wordCard;
  }

  void addRandomLettersToAnswers() {
    int randomLetterIndex = Random().nextInt(respuestas[index].length);
    notUsedLetters.add(respuestas[index][randomLetterIndex]);
  }

  Widget getSingleLetterBox(String letter, int letterSize, int letterIndex) {
    String letterText =
        Random().nextDouble() <= probabilityOfNotShowingLetter ? ' ' : letter;
    if (letterText == ' ') {
      probabilityOfNotShowingLetter = 0.05;
      notUsedIndexes.add(letterIndex);
      notUsedLetters.add(letter);
    } else {
      probabilityOfNotShowingLetter += 0.25;
    }

    currentStateOfWord.add(letterText);

    return Card(
      color: RandomColor().getColor(),
      margin: const EdgeInsets.all(10),
      child: Center(
        heightFactor: 1,
        widthFactor: 2,
        child: Text(
          letterText,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black87,
              fontSize: (letterSize + 20),
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}

class RandomColor {
  Random random = Random();
  Color getColor() {
    List<Color> colors = [
      Colors.orange.shade300,
      Colors.orange.shade400,
      Colors.orange.shade600,
      Colors.orange
    ];

    return colors[random.nextInt(colors.length)];
  }
}
