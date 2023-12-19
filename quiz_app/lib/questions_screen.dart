import 'package:flutter/material.dart';

class QuistionsScreen extends StatefulWidget {
  const QuistionsScreen({super.key});

  @override
  State<QuistionsScreen> createState() => _QuistionsScreenState();
}

class _QuistionsScreenState extends State<QuistionsScreen> {
  @override
  Widget build(context) {
    return const Center(
        child: Text(
      'Quistions Screen',
      style: TextStyle(
        color: Color.fromARGB(255, 238, 238, 238),
        fontSize: 24,
      ),
    ));
  }
}
