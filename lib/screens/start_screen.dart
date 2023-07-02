import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen( this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png', 
            width: 200,
            color: const Color.fromARGB(124, 255, 255, 255),
          ),

          const SizedBox(height: 30,),

          const Text('Learn Flutter the fun way', style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),

          const SizedBox(height: 30,),

          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: (){
              startQuiz();
            }, 
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.purple,
            ),
            label: const Text('Start quizz')
          )
        ],
      ),
    );
  }
}
