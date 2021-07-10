import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {

  //Function below checks to see if the user has set their shared preferences for
  //lessons and scheduling and if not, the lesson button will not be visible.
  Future<bool> lessonButtonVisibilityFunction() async{
    final prefs = await SharedPreferences.getInstance();
    final symptomIndex = prefs.getInt('symptomIndex');
    final selectedFrequency = prefs.getString('frequency');
    final selectedTimeOfDay = prefs.getString('timeOfDay');
    if(symptomIndex == null || selectedFrequency == null || selectedTimeOfDay == null){
      return false;
    }
    else{
      return true;
    }
  }



}