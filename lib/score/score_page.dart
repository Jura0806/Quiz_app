import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:islam_quiz/components/quiz_controll.dart';
import 'package:islam_quiz/constants/constants.dart';
import 'package:islam_quiz/pages/quiz_page.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:get/get.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());

    var sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", height:sizeHeight, fit: BoxFit.cover),
          Column(
            children: [
              Spacer(flex: 2,),
              Text(
                "Score",
                style: Theme.of(context).
                textTheme.headline3!.copyWith(
                  color: kSecondaryColor
                ),
              ),
              Spacer(),
              Text(
                "${_qnController.numOffCorrectAns * 10}/${_qnController.questions.length*10}",
               style:  Theme.of(context).textTheme.headline4!.copyWith(
                   color: kSecondaryColor
               ),
              ),
              SizedBox( height: 20,),
              InkWell(
                onTap: () {
                  _qnController.onInit();
                  Get.to(QuizPage());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.all(kDefaultPadding*0.75),
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Again started",
                    style: Theme.of(context).textTheme.button!.copyWith(
                        color: Colors.black
                    ),
                  ),
                ),
              ),
              Spacer(flex: 2,),
            ],
          )
        ],
      ),
    );
  }
}
