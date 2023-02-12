import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Widget QuestionCard() {
    return Card();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
      ),
      body: Center(
        child: Lottie.network(
            "https://assets1.lottiefiles.com/packages/lf20_4s3kvfcn.json"),
      ),
    );
  }
}
