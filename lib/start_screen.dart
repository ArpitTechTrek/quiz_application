import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(141, 255, 255, 255),
          ),
          const SizedBox(height: 50),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.nunito(
              fontSize: 20,
              color: const Color.fromARGB(170, 255, 255, 255),
            ),
          ),
          const SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.green,
                  Colors.blue
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            child: ElevatedButton.icon(
              onPressed:startQuiz,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20,),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
                icon: const Icon(Icons.arrow_forward_ios),
                label: Text(
                  "Start Quiz",
                  style: GoogleFonts.nunito(
                  color: Colors.white
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
