import 'package:flutter/material.dart';
import 'package:quizz_app/screens/questions_screen.dart';
import 'package:quizz_app/screens/result_screen.dart';
import 'package:quizz_app/screens/start_screen.dart';
import 'package:quizz_app/data/question.dart';

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
  List<String> selectedAnswer = [];
  void switchScreen() {
    setState(() {
      activateScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        //selectedAnswer = [];
        activateScreen = 'result-screen';
      });
    }
  }

  void restartQuizz (){
    setState(() {
      selectedAnswer = [];
      activateScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activateScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    } else if (activateScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswer,
        onRestart: restartQuizz,
      );
    }
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
          child: screenWidget,
          // child: activateScreen == 'start-screen'
          //     ? StartScreen(switchScreen)
          //     : QuestionScreen(onSelectAnswer: chooseAnswer)
        ),
      ),
    );
  }
}
