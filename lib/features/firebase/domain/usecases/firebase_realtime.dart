import 'package:core_module/features/firebase/data/repositories/firebase_realtime_repository_impl.dart';

class FirebaseRealtimeService {
  final FirebaseRealtimeRepositoryImpl _repository = FirebaseRealtimeRepositoryImpl();

  Future<void> delete(
      {required String path, required Function(bool success) result}) async {
    _repository.delete(path: path, result: result);
  }

  Future<List<Map<String, dynamic>>> read(
      {required String path}) async {
    return await _repository.read(path: path);
  }

  Future<void> update(
      {required String path,
      required dynamic value,
      required Function(bool success) result}) async {
    _repository.update(path: path, value: value, result: result);
  }

  Future<void> write(
      {required String path,
        required dynamic value,
      required Function(bool success) result}) async {
    _repository.write(path: path,value: value,  result: result);
  }

  void listen(
      {required String path, required Function(dynamic data) listener}) {
    _repository.listen(path: path, listener: listener);
  }
}
