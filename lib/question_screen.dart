import 'package:flutter/material.dart';
import 'package:quiz_application/answer_button.dart';
import 'package:quiz_application/data/questions.dart';

class QuestionScreen extends StatefulWidget {

  const QuestionScreen({super.key});
  
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {

  final currentQuestion = questions[0];

  @override
  Widget  build(context){
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.text, style: const TextStyle(color: Colors.white),), 
            const SizedBox(height: 30),
        
            //here we map over the answers and dynamically create AnswerButton widgets.
            ...currentQuestion.answers.map((answer){
              return AnswerButton(answerText: answer, onTap: () {},);
            }),
          ],
        ),
      ),
    );
  }
}