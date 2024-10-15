import 'package:core_module/core_module.dart';
import 'package:core_module/features/storage/domain/repositories/storage_interface.dart';

class StorageSecureImpl implements StorageInterface {
  late FlutterSecureStorage storage;

  @override
  Future<void> delete({required String key}) async {
    await storage.delete(key: key);
  }

  @override
  Future getValue({required String key}) async {
    String? value = await storage.read(key: key);
    return value ?? '';
  }

  @override
  Future<void> write({required String key, required value}) async {
    await storage.write(key: key, value: value);
  }

  @override
  Future<void> initStorage() async {
    storage = const FlutterSecureStorage();
    print("amsdev inicio bien el preferences");
  }
}
