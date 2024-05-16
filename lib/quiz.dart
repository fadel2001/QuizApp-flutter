import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/questionspage.dart';
import 'package:quiz_app/result.dart';
import 'data/questions.dart';
import 'home.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  Widget? activeScreen;

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      // Cheque if the number of user answers is equal to the number of questions => Back to Home Page
      setState(() {
        activeScreen = Result(selectedAnswer, restart);
      });
    }
    log(selectedAnswer.toString()); // to print the user answer in the console
  }

  void restart() {
    setState(() {
      selectedAnswer = [];
    });
    activeScreen = Home(switchScreen);
  }

  @override
  void initState() {
    super.initState();
    activeScreen = Home(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionPage(chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurpleAccent,
                Colors.purpleAccent,
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
