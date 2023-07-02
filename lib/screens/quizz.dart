import 'package:flutter/material.dart';
import 'package:quizz_app/screens/questions_screen.dart';
import 'package:quizz_app/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activateScreen = 'start-screen';

  // @override
  // // void initState() {

  // //   activateScreen = StartScreen(switchScreen);
  // //   super.initState();
  // // }
  void switchScreen() {
    setState(() {
      activateScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 78, 13, 151),
                  Color.fromARGB(255, 107, 15, 168)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: activateScreen == 'start-screen'
                ? StartScreen(switchScreen)
                : const QuestionScreen()),
      ),
    );
  }
}
