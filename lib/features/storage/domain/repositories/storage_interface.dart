abstract class StorageInterface{
  Future<void> write({required String key, required dynamic value});
  Future<void> delete({required String key});
  dynamic getValue({required String key});
  Future<void> initStorage();
}