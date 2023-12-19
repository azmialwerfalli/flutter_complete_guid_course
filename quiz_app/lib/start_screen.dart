import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
            ),
            const SizedBox(height: 80),
            const Text(
              'Learn Flutter the Fun Way!',
              style: TextStyle(
                color: Color.fromARGB(255, 238, 238, 238),
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white
              ),
              child: const Text(
                'Start Quiz',
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      );
    // );
  }
}
