import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:islam_quiz/components/progressbar.dart';
import 'package:islam_quiz/components/question_card.dart';
import 'package:islam_quiz/components/quiz_controll.dart';
import 'package:islam_quiz/constants/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:get/get.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final QuestionController _questionController = Get.put(QuestionController());

    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    return  Stack(
      children: [
        WebsafeSvg.asset("assets/icons/bg.svg", height:sizeHeight, fit: BoxFit.cover ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              SizedBox(height: kDefaultPadding,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(
                    () =>  Text.rich(
                        TextSpan(
                            text: "Question ${_questionController.questionNumber.value}",
                            style: Theme.of(context).textTheme.headline4!.copyWith(
                                color: kSecondaryColor
                            ),
                            children: [
                              TextSpan(
                                  text: "/${_questionController.questions.length}",
                                  style: Theme.of(context).textTheme.headline5!.copyWith(
                                      color: kSecondaryColor
                                  )
                              )
                            ]
                        )
                    ),
                )
              ),
              Divider(thickness: 1.5,),
              SizedBox(height: kDefaultPadding,),
             Expanded(child: PageView.builder(
               physics: NeverScrollableScrollPhysics(),
               controller: _questionController.pageController,
               onPageChanged: _questionController.updateTheQnNumber,
               itemCount: _questionController.questions.length,
               itemBuilder: (context, index) => QuestionCard(question: _questionController.questions[index],),
             ),
             ),

            ],
          ),
        )
      ],
    );
  }
}



