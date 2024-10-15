
import 'package:core_module/features/storage/data/repositories/storage_preference_impl.dart';
import 'package:get_it/get_it.dart';


final slCore = GetIt.instance;

void initCoreDependencies() {

  slCore.registerLazySingleton<StoragePreferencesImpl>(() => StoragePreferencesImpl());
  print('EmailVerificationCubit registered');
}
