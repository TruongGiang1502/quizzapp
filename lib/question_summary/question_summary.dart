import 'package:flutter/material.dart';
import 'package:quizz_app/question_summary/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({required this.summaryData, super.key});
  
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: SingleChildScrollView(
        child: Column(
          children:
            summaryData.map((data){
              return SummaryItem(itemData: data);
            }).toList()
        ),
      ),
    );
  }
}