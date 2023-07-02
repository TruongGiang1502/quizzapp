import 'package:flutter/material.dart';
import 'package:quizz_app/gradient_container.dart';
//import 'package:quizz_app/screens/start_screen.dart';

void main(){
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(),
        ),
      ),
  );
}