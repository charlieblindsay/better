class ResultsBrain{

  String getScoreMessage({int score}){
    if(score <= 4){
      return 'Not Depressed';
    }
    else if (score > 4 && score <= 9){
      return 'Mild depression';
    }
    else if (score > 9 && score <= 14){
      return 'Moderate depression';
    }
    else if (score > 14 && score <= 19){
      return 'Moderately severe depression';
    }
    else if (score > 19 && score <= 27){
      return 'Severe depression';
    }
    return 'Error obtaining score message';
  }

  String getScoreMeaning({int score}){
    if(score <= 4){
      return "Based on your responses, you're not currently experiencing many of the symptoms seen in depression. "
          "However, if you have any concerns about your health or mood, please call NHS 111 or arrange to speak to your "
          "GP if these symptoms persist for 2 weeks, please retry this screening toolAlternatively, if you would like to begin "
          "improving specific symptoms, why not take a look at our courses and design you own plan!";
    }
    else{
      return "Based on your responses to questions 1-8, you are experiencing some symptoms seen in depression but only an "
          "experienced health professional can tell for sure. You should make an appointment to see your GP for a review or "
          "call NHS 111. Both can help you and assess whether you might benefit from extra support or treatment.Whilst you are "
          "waiting for your appointment, why not start improving your symptoms by taking  a look at our courses and designing "
          "you own plan!";
    }
  }

}