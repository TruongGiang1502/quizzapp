import 'package:flutter/material.dart';
import 'package:quizz_app/data/question.dart';
import 'package:quizz_app/question_summary/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    required this.chosenAnswers,
    required this.onRestart, 
    super.key
  });
  final List <String> chosenAnswers;
  final void Function() onRestart;

List <Map<String, Object>> get getSummaryData{
  final List<Map<String, Object>> summary = [];

  for (var i = 0; i<chosenAnswers.length; i++){
    summary.add({
      'question_index': i,
      'Câu hỏi': questions[i].text,
      'Câu trả lời đúng': questions[i].answers[0],
      'Người trả lời': chosenAnswers[i]
    });
  }
  return summary;
}

  @override
  Widget build(BuildContext context) {
   
    final numTotalQuestion = questions.length;
    final numCorrectAnswer = getSummaryData.where((data) {
      return data['Người trả lời'] == data['Câu trả lời đúng'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bạn đã trả lời đúng $numCorrectAnswer trong số $numTotalQuestion câu hỏi',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white, 
                fontSize: 18, 
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData: getSummaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white
              ),
              label: const Text('Làm lại bài kiểm tra'),
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}