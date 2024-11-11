import 'package:flutter/material.dart';
import 'package:quiz_application/data/questions.dart';
import 'package:quiz_application/question_screen.dart';
import 'package:quiz_application/result_screen.dart';
import 'package:quiz_application/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  // Here we initialize an empty list to store the selected answers.
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void switchScreen(){
    setState(() {
      activeScreen = 'question-screen';
    });
  }
  //Here we store the selected answers in the selectedAnswers list.
  void chooseAnswers(String answer){
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {

    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      //Here we pass the answers function to the QuestionScreen widget.
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswers);
    }else if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(selectedAnswers: selectedAnswers);
    }

	return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.green,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}