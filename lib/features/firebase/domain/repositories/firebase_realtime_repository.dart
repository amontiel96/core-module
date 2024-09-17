abstract class FirebaseRealtimeRepository{
  Future<void> write({required String path, required dynamic value, required Function(bool success) result});
  Future<void> update({required String path, required dynamic value, required Function(bool success) result});
  Future<void> delete({required String path, required Function(bool success) result});
  Future<void> read({required String path, required Function(dynamic value) result});
  void listen({required String path, required Function(dynamic data) listener});
}