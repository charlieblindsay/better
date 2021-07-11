import 'package:get_it/get_it.dart';

import 'services/shared_preferences_service.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => SharedPreferencesService());
}