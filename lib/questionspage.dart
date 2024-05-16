import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';

import 'data/questions.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage(this.onSelectedAnswer, {super.key});

  final void Function(String) onSelectedAnswer;


  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer){
    widget.onSelectedAnswer(answer); 
    setState(() {
      currentQuestionIndex++ ;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 250, 221, 252),
              fontWeight: FontWeight.bold,
              fontSize: 24,
              ),
            textAlign: TextAlign.center,
          ),
          ...currentQuestion.shuffledAnswers.map(
            (e) {
              return Container(
                margin: const EdgeInsets.all(5),
                child: AnswerButton(
                  answerText: e,
                  onPressed: (){
                    answerQuestion(e);
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
