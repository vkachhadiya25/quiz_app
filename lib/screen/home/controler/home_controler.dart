import 'dart:async';

import 'package:get/get.dart';
import 'package:quiz_app/screen/home/model/home_model.dart';
import 'package:quiz_app/utils/api_helper.dart';

class HomeController extends GetxController {
  Rxn<HomeModel> homeModel = Rxn();
  RxList<QuizModel> quizList = <QuizModel>[].obs;
  RxInt index = 0.obs;
  RxInt totalScore = 0.obs;
  RxInt count = 20.obs;
  Timer? timer;

  Future<void> getQuiz() async {
    APIHelper apiHelper = APIHelper();
    HomeModel? m1 = await apiHelper.quizAPICall();
    homeModel.value = m1;
    if (homeModel.value != null) {
      List<QuizModel> result = [];
      for (ResultModel r1 in homeModel.value!.resultList!) {
        List allOption = r1.incorrectAnswers!;
        allOption.add(r1.correct_answer);
        allOption.shuffle();

        QuizModel q1 = QuizModel(
          question: r1.question,
          correct_answer: r1.correct_answer,
          option: allOption,
        );
        result.add(q1);
      }
      quizList.value = result;

      update();
    }
  }


  void result(String selectAns) {
    if (selectAns == quizList[index.value].correct_answer) {
      totalScore.value++;
    }
  }

  void countDownTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (count > 0 && index.value != quizList.length) {
        count.value--;
      } else {
        if (index.value != quizList.length - 1) {
          index.value++;
        } else {
          timer.cancel();
          Get.offAllNamed('result');
        }
        count.value = 20;
      }
      print("$count");
    });
  }
}
