import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Lottie.network(
            "https://assets1.lottiefiles.com/packages/lf20_4s3kvfcn.json"),
      ),
    );
  }
}
