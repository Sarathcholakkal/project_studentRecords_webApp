import 'package:get_it/get_it.dart';
import 'package:student_records/services/locator/navigation_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
