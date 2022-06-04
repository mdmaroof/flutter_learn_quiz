import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var _totalScore = 0;

  var newArray = [
    {
      'question': 'What\'s you favourite color ?',
      'answer': [
        {'text': 'Red', 'Score': 2},
        {'text': 'Blue', 'Score': 9},
        {'text': 'Green', 'Score': 6},
        {'text': 'Yellow', 'Score': 5}
      ]
    },
    {
      'question': 'What\'s you favourite city ?',
      'answer': [
        {'text': 'Bangalore', 'Score': 5},
        {'text': 'Delhi', 'Score': 4},
        {'text': 'Mumbai', 'Score': 7},
        {'text': 'Lucknow', 'Score': 3},
      ]
    }
  ];

  void firstFunction(int score) {
    _totalScore += score;

    print(_totalScore);

    if (questionIndex < newArray.length) {
      setState(() {
        questionIndex = questionIndex + 1;
      });
    } else {
      print('Over');
    }
  }

  void restartFunction() {
    setState(() {
      questionIndex = 0;
      _totalScore = 0;
    });
  }

  String get resultPhase {
    String resultText;
    if (_totalScore < 5) {
      resultText = 'You Taste Is Not Good';
    } else if (_totalScore < 8) {
      resultText = 'Prefrence Can Be Given';
    } else if (_totalScore >= 12) {
      resultText = 'Love Your Taste';
    } else {
      resultText = 'What\'s your Taste';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: questionIndex < newArray.length
            ? Column(
                children: [
                  Question(newArray[questionIndex]['question']),
                  ...(newArray[questionIndex]['answer']
                          as List<Map<String, Object>>)
                      .map((list) {
                    return Answer(
                        () => firstFunction(list['Score']), list['text']);
                  }).toList(),
                ],
              )
            : Center(
                child: Column(
                  children: [
                    Text(
                      resultPhase,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                        onPressed: () => restartFunction(),
                        child: Text('Restart Button'))
                  ],
                ),
              ),
      ),
    );
  }
}
