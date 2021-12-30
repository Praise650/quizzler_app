import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler_app/QuestionModel/question_controller.dart';
import 'package:quizzler_app/scoreKeeper/score_keeper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Quizzer App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int questionNumber = 0;
  ScoreKeeper lists = ScoreKeeper();
  final quizController = QuizController();

  @override
  Widget build(BuildContext context) {
    bool answers = quizController.checkAnswer(questionNumber);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  'This is where the question text will go',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(quizController.getQuestion(questionNumber)),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    if (questionNumber < 4) {
                      setState(() {
                        questionNumber++;
                      });
                    } else {
                      setState(() {
                        questionNumber = 0;
                      });
                    }

                    if (answers == true) {
                      setState(() {
                        lists.list.add(Icon(
                          Icons.check,
                          color: Colors.green,
                        ));
                      });
                    } else {
                      setState(() {
                        lists.list.add(Icon(
                          Icons.close,
                          color: Colors.red,
                        ));
                      });
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: Text(
                    'True',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      if (questionNumber < 4) {
                        setState(() {
                          questionNumber++;
                        });
                      } else {
                        setState(() {
                          questionNumber = 0;
                        });
                      }
                    });
                    if (answers == false) {
                      setState(() {
                        lists.list.add(Icon(
                          Icons.check,
                          color: Colors.green,
                        ));
                      });
                    } else {
                      setState(() {
                        lists.list.add(Icon(
                          Icons.close,
                          color: Colors.red,
                        ));
                      });
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: Text(
                    'False',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              children: lists.list,
            ),
          )
        ],
      ),
    );
  }
}
