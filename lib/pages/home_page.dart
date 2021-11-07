import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:islam_quiz/constants/constants.dart';
import 'package:islam_quiz/pages/quiz_page.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:get/get.dart';


class WelcomePage extends StatefulWidget {
 // const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", height:sizeHeight, width: sizeWidth ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2,),
                  Text("Let's Play Quiz",style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 5,),
                  Text("Enter your information below"),
                  Spacer(),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: "Full Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      )
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () => Get.to(QuizPage()),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: EdgeInsets.all(kDefaultPadding*0.75),
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Let's start Quiz",
                        style: Theme.of(context).textTheme.button!.copyWith(
                          color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  Spacer(flex: 2,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
