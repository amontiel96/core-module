import 'package:core_module/features/storage/data/repositories/storage_preference_impl.dart';

mixin PreferencesStorageCase {
  final StoragePreferencesImpl _repository = StoragePreferencesImpl();

  Future<void> initPreferences() async {
    await _repository.initStorage();
  }



}
