import 'package:get_it/get_it.dart';
import 'package:mvcexample/controller/navigation/navigation_service.dart';
import 'package:mvcexample/controller/services/users_details_services/user_details_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => UsersDetailsService());
}
