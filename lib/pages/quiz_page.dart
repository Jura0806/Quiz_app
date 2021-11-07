import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:islam_quiz/components/body.dart';
import 'package:islam_quiz/components/quiz_controll.dart';
import 'package:get/get.dart';


class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          FlatButton(onPressed: _controller.nextQuestion, child: Text("Skip")),
        ],
      ),
      body: Body()
    );
  }
}
