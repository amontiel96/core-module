

import 'package:core_module/features/storage/data/repositories/storage_preference_impl.dart';
import 'package:core_module/features/storage/data/repositories/storage_secure_impl.dart';

class StorageCoreService
{
    StorageCoreService._();

    static final StorageCoreService instance = StorageCoreService._();

    final StoragePreferencesImpl _repository = StoragePreferencesImpl();
    final StorageSecureImpl _repositorySecure = StorageSecureImpl();

    Future<void> initStorageServices()async{
        _repository.initStorage();
        _repositorySecure.initStorage();
    }

    StoragePreferencesImpl get prefs => _repository;
    StorageSecureImpl get secure => _repositorySecure;

}

enum StorageDataType { int, string, double, bool, list }
