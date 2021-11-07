import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islam_quiz/components/quiz_controll.dart';
import 'package:islam_quiz/constants/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 35,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF3F4768),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) {

          return Stack(
            children: [
              LayoutBuilder(
                builder: (context, constrainst) =>
                    Container(
                      width: constrainst.maxWidth * controller.animation.value,
                      decoration: BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.circular(50)
                      ),
                    ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${(controller.animation.value*60).round()}"),
                      WebsafeSvg.asset("assets/icons/clock.svg"),
                    ],
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
