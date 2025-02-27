import 'package:flutter/material.dart';
import 'package:quiz/screens/quiz_page.dart';

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
