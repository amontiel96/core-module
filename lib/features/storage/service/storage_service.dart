

import 'package:core_module/features/storage/data/repositories/storage_preference_impl.dart';

class StorageCoreService
{
    StorageCoreService._();

    static final StorageCoreService instance = StorageCoreService._();

    final StoragePreferencesImpl _repository = StoragePreferencesImpl();

    Future<void> initStorageServices()async{
        _repository.initStorage();
    }

    StoragePreferencesImpl get prefs => _repository;

}

enum StorageDataType { int, string, double, bool }
