import 'package:get/get.dart';
import 'package:quiz_app/screen/home/model/home_model.dart';
import 'package:quiz_app/utils/api_helper.dart';

class HomeController extends GetxController {
  Rxn<HomeModel> homeModel = Rxn();
  RxList<QuizModel> quizList = <QuizModel>[].obs;
  RxInt index = 0.obs;
  RxInt totalScore = 0.obs;

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

  Future<void> questionNext() async {
    if (homeModel.value != null &&
        index.value != homeModel.value!.resultList!.length - 1) {
      index.value++;
    }
  }

  void result() {
  }
}
