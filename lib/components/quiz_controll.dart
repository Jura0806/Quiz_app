
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:islam_quiz/models/model.dart';
import 'package:islam_quiz/score/score_page.dart';

class QuestionController extends  GetxController with SingleGetTickerProviderMixin{

  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;
  
  List<Question> _questions = sample_data.map(
          (question) => Question(
          id: question['id'],
            question:  question['question'],
            options: question['options'],
            answer: question['answer_index'],
          )).toList();

  List<Question> get questions => this._questions;

  bool _isAnswered =  false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns =>this._correctAns;

  late int _selectAns;
  int get selectAns => this._selectAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  late int _numOffCorrectAns = 0;
  int get numOffCorrectAns => this._numOffCorrectAns;

  @override
  void onInit() {
    // TODO: implement onInit
    _animationController = AnimationController(duration: Duration(seconds: 60),vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward().whenComplete(nextQuestion);

    _pageController = PageController();
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex){
    _isAnswered = true;
    _correctAns = question.answer;
    _selectAns = selectedIndex;

    if(_correctAns == selectedIndex) _numOffCorrectAns++;

    _animationController.stop();
    update();
    
    Future.delayed(Duration(seconds: 2), (){
      nextQuestion();
    });
  }

  void nextQuestion(){
    if(_questionNumber.value != _questions.length){
      _isAnswered = false;
      _pageController.nextPage(duration: Duration(microseconds: 250), curve: Curves.ease);

      _animationController.reset();

      _animationController.forward().whenComplete(nextQuestion);
    }else {
      Get.to(ScorePage());
    }
  }

  void updateTheQnNumber(int index){
    _questionNumber.value = index + 1;
  }
}