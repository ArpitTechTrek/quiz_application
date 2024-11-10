import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_application/answer_button.dart';
import 'package:quiz_application/data/questions.dart';

class QuestionScreen extends StatefulWidget {

  const QuestionScreen({super.key, required this.onSelectAnswer});

  //Here we define a final function that will be called when the user selects an answer.
  final void Function(String answer) onSelectAnswer;
  
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {

  //Here we set the initial question index to 0. and it will increment whenever the user answers a question.
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswers){
    //Here we call the onSelectAnswer function and pass the selected answer.
    widget.onSelectAnswer(selectedAnswers);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget  build(context){
    
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text, 
              style: GoogleFonts.nunito(
                color: const Color.fromARGB(170, 255, 255, 255),
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ), 
            const SizedBox(height: 30),
            //here we map over the answers and dynamically create AnswerButton widgets.
            ...currentQuestion.getShuffledAnswers().map((answer){
              return AnswerButton(answerText: answer, onTap: (){
                answerQuestion(answer);
              });
            }),
          ],
        ),
      ),
    );
  }
}