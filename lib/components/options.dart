import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:islam_quiz/components/quiz_controll.dart';
import 'package:islam_quiz/constants/constants.dart';

class Option extends StatelessWidget {
  const Option({Key? key,  required this.text, required this.index, required this.press}) : super(key: key);

  final  String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context){
    return  GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (qnController) {
        Color getTheRightColor(){
          if(qnController.isAnswered) {
            if (index == qnController.correctAns) {
              return kGreenColor;
            } else if (index == qnController.selectAns &&
                qnController.selectAns != qnController.correctAns) {
              return kRedColor;
            }
          }
          return kGrayColor;
        }

        IconData getTheRightIcon(){
          return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
        }
        return InkWell(
          onTap: press,
          child: Container(
            margin: EdgeInsets.only(top: kDefaultPadding),
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: getTheRightColor(),
                ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${index + 1} $text",
                  style: TextStyle(color: getTheRightColor(), fontSize: 16),
                ),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: getTheRightColor() == kGrayColor ? Colors.transparent : getTheRightColor(),
                      borderRadius: BorderRadius.circular(26),
                      border: Border.all(color: kGrayColor,),
                  ),
                  child: getTheRightColor() == kGrayColor ? null: Icon(getTheRightIcon(), size: 16,),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
