import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:sitake_mobile/utils/constants.dart';

import '../models/question_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Widget answers(
      {required List<Answer> answers, required Function(dynamic) setAnswer}) {
    return ListView.builder(
        itemCount: answers.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(""),
              leading: Radio(
                  value: answers[index],
                  groupValue: answers[index],
                  onChanged: setAnswer),
            ));
  }

  Widget questionCard() {
    return Card();
  }

  Widget timer({required int timeMinute}) {
    return TweenAnimationBuilder<Duration>(
        duration: Duration(minutes: timeMinute),
        tween: Tween(begin: Duration(minutes: timeMinute), end: Duration.zero),
        onEnd: () {
          print('Timer ended');
        },
        builder: (BuildContext context, Duration value, Widget? child) {
          final minutes = value.inMinutes;
          final seconds = value.inSeconds % 60;
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text('$minutes:$seconds',
                  textAlign: TextAlign.center, style: h3Style));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Ionicons.checkmark_done,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.timelapse,
              color: Colors.black,
            ),
            timer(timeMinute: 1)
          ],
        ),
      ),
      body: Center(
        child: Lottie.network(
            "https://assets1.lottiefiles.com/packages/lf20_4s3kvfcn.json"),
      ),
    );
  }
}
