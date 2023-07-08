import 'package:flutter/material.dart';
import 'question_identifier.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({required this.itemData, super.key});
  final Map<String, Object> itemData;
  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = itemData['Người trả lời'] == itemData['Câu trả lời đúng'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnwer: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int, 
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['Câu hỏi'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Bạn trả lời: ${itemData['Người trả lời'] as String}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 202, 171, 252),
                  ),
                ),
                Text(
                  'Đáp án đúng: ${itemData['Câu trả lời đúng'] as String}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 181, 254, 246),
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
