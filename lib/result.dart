import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/summary.dart';


class Result extends StatelessWidget {
  const Result(this.selectedAnswer, this.restart, {super.key});

  final List<String> selectedAnswer;
  final void Function() restart;


  List<Map<String, Object>>get summaryData{

    final List<Map<String, Object>> summary = [];

    for(var i=0; i<selectedAnswer.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var numOfCorrectAnswer=0;
    for(var i=0; i<summaryData.length; i++){
      if(summaryData[i]['user_answer'] == summaryData[i]['correct_answer']){
        numOfCorrectAnswer++;
      }
    }
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'you answered $numOfCorrectAnswer out ${questions.length} questions correctly!',
            style: const TextStyle(
              color:Color.fromARGB(255, 250, 221, 252),
              ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30,),
          Summary(summaryData),
          const SizedBox(height: 30,),
          TextButton.icon(
          onPressed: restart,
          icon: const Icon(
            Icons.restart_alt_outlined, 
            color: Colors.white,
            ),
          label: const Text('Restarat Quiz !',
          style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      ),
          ),
          ),
        ],
      ),
    );
  }
}

