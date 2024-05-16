import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map(
              (e) => Column(
                children: [
                  Row(
                children: [
                  CircleAvatar(
                    radius: 15, 
                    backgroundColor: 
                    e['user_answer'] == e['correct_answer']?
                    Colors.blue:Colors.red[300],
                    child: Text(((e['question_index'] as int)+1).toString())),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e['question'].toString(), 
                        
                        ),
                        const SizedBox(height: 6,),
                        Text(e['user_answer'].toString()),
                        Text(e['correct_answer'].toString(),
                        style: const TextStyle(
                          color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              ],
              ),
              ),
          ],
        ),
      ),
    );
  }
}