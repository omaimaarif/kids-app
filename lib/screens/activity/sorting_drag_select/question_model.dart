class QuestionModel{
  final String title;
  final List<String> answers;
  final List<String> images;
  final int? numOfTrueAnswer;
  final String typeOfQuestion;


  QuestionModel(this.numOfTrueAnswer,

      {

        required this.images,
        required this.title,
        required this.answers, required this.typeOfQuestion});

}