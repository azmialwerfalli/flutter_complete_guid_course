import 'package:flutter/material.dart';

class QuistionsScreen extends StatefulWidget {
  const QuistionsScreen({super.key});

  @override
  State<QuistionsScreen> createState() => _QuistionsScreenState();
}

class _QuistionsScreenState extends State<QuistionsScreen> {
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'The Question...',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Answer 1'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Answer 2'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Answer 3'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Answer 4'),
        ),
      ],
    )
        // ),
        );
  }
}
