import 'package:fundall/core/viewModels/userVM.dart';
import 'package:get_it/get_it.dart';

import 'core/services/api.dart';


GetIt locator = GetIt.instance;
setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => UserVM());
}
