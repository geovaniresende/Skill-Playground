import 'package:get_it/get_it.dart';
import 'core/services/counter_service.dart';
import 'core/services/platform_service.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<CounterService>(() => CounterService());
  sl.registerLazySingleton<PlatformService>(() => PlatformService());
}
