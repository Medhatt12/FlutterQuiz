import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what\'s your favourite color?',
      'answers': [
        {'text': 'blue', 'score': 10},
        {'text': 'black', 'score': 5},
        {'text': 'Green', 'score': 2},
        {'text': 'white', 'score': 1}
      ]
    },
    {
      'questionText': 'what\'s your favourite animal?',
      'answers': [
        {'text': 'Cat', 'score': 10},
        {'text': 'Dog', 'score': 5},
        {'text': 'Tiger', 'score': 2},
        {'text': 'Elephant', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favourite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore=0;

  void _resetQuiz(){
    setState(() {
      _questionIndex =0;
      _totalScore =0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
   // print(_totalScore);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App\'s'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
