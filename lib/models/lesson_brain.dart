import 'package:shared_preferences/shared_preferences.dart';
import 'package:bettr_mvp/models/plan_brain.dart';

class Lesson {
  final int symptomIndex;

  Lesson({this.symptomIndex});

  Future<int> getCurrentLessonIndex() async{
    final prefs = await SharedPreferences.getInstance();
    String hashCode = '${symptomsList[this.symptomIndex]['symptom']}LessonIndex';
    int currentLessonIndex = prefs.getInt(hashCode);
    //If the above shared preference has not been set yet.
    if (currentLessonIndex == null){
      prefs.setInt(hashCode, 0);
      return 0;
    }
    else{
      return currentLessonIndex;
    }
  }

  Future<int> changeCurrentLessonIndex({bool increment}) async{
    int currentLessonIndex = await getCurrentLessonIndex();
    int addedNumber = increment? 1 : -1;
    final prefs = await SharedPreferences.getInstance();
    String hashCode = '${symptomsList[this.symptomIndex]['symptom']}LessonIndex';
    currentLessonIndex = prefs.getInt(hashCode);
    if (currentLessonIndex == null){
      await prefs.setInt(hashCode, 0);
      return 0;
    }
    else{
      await prefs.setInt(hashCode, currentLessonIndex + addedNumber);
      return currentLessonIndex + 1;
    }
  }
  
  String getCurrentLesson(int currentLessonIndex){
    List lessonList = lessonsLists[symptomsList[this.symptomIndex]['symptom']];
    return lessonList[currentLessonIndex];
  }
  
}