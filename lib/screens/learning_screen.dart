import 'package:flutter/material.dart';
import 'package:sitake_mobile/models/course_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sitake_mobile/models/data.dart';
import 'package:sitake_mobile/widgets/input_field.dart';

import '../utils/constants.dart';

class LearningScreen extends StatefulWidget {
  const LearningScreen({Key? key}) : super(key: key);

  @override
  _LearningScreenState createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  Widget _listViewItem(CourseModel course, int index) {
    Widget widget;
    widget = Column(
      children: [
        Hero(
            tag: index,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(course.image, width: 150, height: 150),
            )),
        const SizedBox(height: 10),
        Text(course.title.addOverFlow, style: h4Style),
        Row(
          children: [
            RatingBar.builder(
              itemPadding: EdgeInsets.zero,
              initialRating: course.score.toDouble(),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              glow: false,
              ignoreGestures: true,
              itemBuilder: (_, __) => const Icon(
                Icons.star,
                size: 2.0,
                color: lightOrange,
              ),
              onRatingUpdate: (rating) {},
            ),
            const SizedBox(width: 10),
            Text(course.score.toString(), style: h4Style),
          ],
        )
      ],
    );

    return GestureDetector(
      onTap: () => {},
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Nanda",
                      style: h1Style,
                    ),
                    Text(
                      "Statistik Pembelajaran",
                      style: h4Style,
                    )
                  ]),
            )),
        Container(
          height: 70,
        ),
        InputField(
          keyboard: TextInputType.text,
          obscure: false,
          hint: "Cari",
          iconData: Icons.search,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            reverse: true,
            physics: const ClampingScrollPhysics(),
            itemCount: courses.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 10),
                child: _listViewItem(courses[index], index),
              );
            },
          ),
        ),
      ],
    ));
  }
}
