import 'package:flutter/material.dart';
import 'package:gamificacion/entities/ChallengeResult.dart';

class ResultPage extends StatefulWidget {
  final ChallengeResult results;
  const ResultPage({Key? key, required this.results}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  //widget.results
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        home: ListView(
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.deepOrange,
              child: Center(
                child: Text(
                  widget.results.challengeType,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 30,
                      decoration: TextDecoration.none),
                ),
              ),
            ),
            const Divider(),
            Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              color: Colors.white,
              child: const Text(
                'Resumen prueba',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black45,
                    letterSpacing: 1,
                    fontSize: 25,
                    decoration: TextDecoration.none),
              ),
            ),
            Container(
              height: 50,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Card(
                    color: Colors.green,
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Icon(Icons.check),
                    ),
                  ),
                  const VerticalDivider(),
                  Text(
                    widget.results.correctAnswerCount.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 30,
                        decoration: TextDecoration.none),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Card(
                    color: Colors.red,
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Icon(Icons.clear_outlined),
                    ),
                  ),
                  const VerticalDivider(),
                  Text(
                    widget.results.incorrectAnswerCount.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 30,
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
            ),
            const Divider(),
            Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Resultados',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black45,
                        letterSpacing: 1,
                        fontSize: 25,
                        decoration: TextDecoration.none),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Card(
                    color: Colors.orange,
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Icon(Icons.sports_esports_outlined),
                    ),
                  ),
                  const VerticalDivider(),
                  Text(
                    (widget.results.correctAnswerCount * 10 +
                            (5 - widget.results.incorrectAnswerCount))
                        .toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 30,
                        decoration: TextDecoration.none),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Card(
                    color: Colors.blue,
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Icon(Icons.person),
                    ),
                  ),
                  const VerticalDivider(),
                  Text(
                    '+' +
                        (widget.results.correctAnswerCount * 10 +
                                (5 - widget.results.incorrectAnswerCount) / 4)
                            .toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 30,
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.white,
              child: Center(
                child: GestureDetector(
                  onTap: () => {Navigator.pushNamed(context, '/')},
                  child: Card(
                    margin: const EdgeInsets.all(1),
                    elevation: 5,
                    shadowColor: Colors.orange.shade700,
                    color: Colors.orange,
                    child: const Text(
                      'Continuar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 30,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
