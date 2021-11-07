import 'package:flutter/material.dart';
import 'package:islam_quiz/components/quiz_controll.dart';
import 'package:islam_quiz/constants/constants.dart';
import 'package:islam_quiz/models/model.dart';
import 'package:get/get.dart';

import 'options.dart';

class QuestionCard extends StatelessWidget {

  final Question question;
  const QuestionCard({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QuestionController _controller = Get.put(QuestionController());

    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: kBlackColor,
            ),
          ),
          SizedBox(height: kDefaultPadding/2,),
         ...List.generate(question.options.length, (index) => Option(
           index: index,
           text: question.options[index],
           press: () => _controller.checkAns(question, index),
         ),
         )
        ],
      ),
    );
  }
}
