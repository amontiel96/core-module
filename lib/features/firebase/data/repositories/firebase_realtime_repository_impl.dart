import 'package:core_module/core_module.dart';
import 'package:core_module/features/firebase/domain/repositories/firebase_realtime_repository.dart';

class FirebaseRealtimeRepositoryImpl implements FirebaseRealtimeRepository {
  @override
  Future<void> delete(
      {required String path, required Function(bool success) result}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref(path);
    await ref.remove().then((_) {
      result(true);
    }).catchError((error) {
      result(false);
    });
  }

  @override
  Future<void> read(
      {required String path, required Function(dynamic value) result}) async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child(path).get();
    if (snapshot.exists) {
      print(snapshot.value);
      result(snapshot.value);
    } else {
      print('No data available.');
      result('nodata');
    }
  }

  @override
  Future<void> update(
      {required String path,
      required dynamic value,
      required Function(bool success) result}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref(path);
    await ref.update(value).then((_) {
      result(true);
    }).catchError((error) {
      result(false);
    });
  }

  @override
  Future<void> write(
      {required String path,
      required dynamic value,
      required Function(bool success) result}) async {
    print("amsdev llega al ultimo metodo de write");
    print("amsdev path: $path");
    print("amsdev value: $value");
    DatabaseReference ref = FirebaseDatabase.instance.ref(path);
    await ref.set(value).then((_) {
      print("amsdev entro then write");
      result(true);
    }).catchError((error) {
      print("amsdev entro cathc write");
      result(false);
    });
  }

  @override
  void listen(
      {required String path, required Function(dynamic data) listener}) {
    DatabaseReference listenRef = FirebaseDatabase.instance.ref(path);
    listenRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      listener(data);
    });
  }
}
