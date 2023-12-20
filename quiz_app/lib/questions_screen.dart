import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuistionsScreen extends StatefulWidget {
  const QuistionsScreen({super.key});

  @override
  State<QuistionsScreen> createState() => _QuistionsScreenState();
}

class _QuistionsScreenState extends State<QuistionsScreen> {
  @override
  Widget build(context) {
    final currentQuestion = questions[0];
    return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.answers.map((answer) {
              return AnswerButton(answerText: answer, onTap: (){});
            }),
            // AnswerButton(answerText: currentQuestion.answers[0], onTap: (){}),
            // AnswerButton(answerText: currentQuestion.answers[1], onTap: (){}),
            // AnswerButton(answerText: currentQuestion.answers[2], onTap: (){}),
            // AnswerButton(answerText: currentQuestion.answers[3], onTap: (){}),

          ],
        )
        // ),
        );
  }
}
