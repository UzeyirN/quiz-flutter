import 'package:flutter/material.dart';

import 'constants.dart';
import 'questionLIst.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0XFFF5F5F5),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Text(
            'Quiz',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuestionList list = QuestionList();

  List<Icon> elections = [];

  int correctAnswersCount = 0;

  void buttonFunction(bool state) {
    if (list.isFinished() == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Your result is $correctAnswersCount\n\n Overall:'
                '${correctAnswersCount / list.getQuestionCount() * 100}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    list.resetIndex();
                    elections = [];
                  });
                },
                child: Text('Return start'),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        if (list.getQuestionAnswers() == state) {
          elections.add(kCorrectIcon);
          correctAnswersCount++;
        } else {
          elections.add(kMistakeIcon);
        }
        list.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              list.getQuestionText(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                buttonFunction(true);
              },
              child: Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: 40,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                buttonFunction(false);
              },
              child: Icon(
                Icons.thumb_down,
                color: Colors.white,
                size: 40,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              children: elections,
              spacing: 5,
              runSpacing: 5,
              alignment: WrapAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
