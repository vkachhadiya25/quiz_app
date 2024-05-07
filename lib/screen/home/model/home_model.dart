class HomeModel {
  int? response_code;
  List<ResultModel>? resultList = [];

  HomeModel({this.resultList, this.response_code});

  factory HomeModel.mapToModel(Map m1) {
    List l1 = m1['results'];
    return HomeModel(
      response_code: m1['response_code'],
      resultList: l1.map((e) => ResultModel.mapToModel(e)).toList(),
    );
  }
}

class ResultModel {
  String? type, difficulty, question, category, correct_answer;
  List?   incorrectAnswers;

  ResultModel(
      {this.category,
      this.correct_answer,
      this.difficulty,
      this.question,
      this.type,
      this.incorrectAnswers});

  factory ResultModel.mapToModel(Map m1) {
    return ResultModel(
      category: m1['category'],
      correct_answer: m1['correct_answer'],
      difficulty: m1['difficulty'],
      question: m1['question'],
      type: m1['type'],
      incorrectAnswers: m1['incorrect_answers'],
    );
  }
}

class QuizModel {
  String? question,correct_answer;
  List? option;

  QuizModel(
      {this.question, this.correct_answer,this.option});
}
