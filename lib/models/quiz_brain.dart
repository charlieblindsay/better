String questionIntroStatement =
    'Over the past two weeks, how often have you felt ...';

List<String> questionsList = [
  'Q1) Little interest or pleasure doing things',
  'Q2) bothered by feeling down, depressed or hopeless?',
  'Q3) bothered by trouble falling or staying asleep, or sleeping too much?',
  'Q4) bothered by feeling tired or having little energy?',
  'Q5) bothered by poor appetite or overeating?',
  'Q6) bothered by by feeling bad about yourself, or that you are a failure, or have let yourself or your family down',
  'Q7) bothered by trouble concentrating on things, such as reading the newspaper or watching television?',
  'Q8) bothered by moving or speaking so slowly that other people could have noticed, or the opposite - being so fidgety or restless that you have been moving around a lot more than usual?',
  'Q9) thoughts that you would be better off dead or of hurting yourself in some way'
];

List<String> optionsList = [
  'Not at all',
  'Several days',
  'More than half the days',
  'Nearly every day'
];

enum Option { A, B, C, D }

class QuizBrain {
  List<Option> optionStateList = [];

  int questionNumber = 0;

  void incrementQuestion() {
    questionNumber += 1;
  }

  void decrementQuestion() {
    questionNumber -= 1;
  }

  void createOptionStateList() {
    for (String question in questionsList) {
      Option option = Option.A;
      optionStateList.add(option);
    }
  }

  int calculateScore() {
    int counter = 0;
    for (Option option in optionStateList) {
      if (option == Option.B) {
        counter += 1;
      } else if (option == Option.C) {
        counter += 2;
      } else if (option == Option.D) {
        counter += 3;
      }
    }
    return counter;
  }

  Option getOptionVariable() {
    return optionStateList[questionNumber];
  }

  void changeOptionVariable(value) {
    optionStateList[questionNumber] = value;
  }

  String nextButtonText() {
    if (questionNumber < questionsList.length - 1) {
      return 'Next Question';
    } else {
      return 'See Results';
    }
  }

  bool quizEnd(){
    if(questionNumber == 8){
      return true;
    }
    else{
      return false;
    }
  }

  bool isFirstQuestion() {
    if (questionNumber == 0) {
      return true;
    } else {
      return false;
    }
  }

  String getQuestion() {
    return questionsList[questionNumber];
  }
}
