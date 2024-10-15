import 'package:core_module/core_module.dart';
import 'package:core_module/features/storage/domain/repositories/storage_interface.dart';


class StoragePreferencesImpl implements StorageInterface{
  late SharedPreferences prefs;
  @override
  Future<void> delete({required String key}) async {
    await prefs.remove(key);
  }

  @override
  getValue({required String key, StorageDataType type = StorageDataType.string}) {
    if (type == StorageDataType.int) {
      return prefs.getInt(key);
    } else if (type == StorageDataType.string) {
      return  prefs.getString(key);
    } else if (type == StorageDataType.double) {
      return  prefs.getDouble(key);
    } else if(type == StorageDataType.bool) {
      return  prefs.getBool(key);
    } else {
      return  prefs.getString(key)?.toString();
    }
  }

  @override
  Future<void> write({required String key, required value})async {
    if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    }else if(value is bool) {
      await prefs.setBool(key, value);
    }
    else {
      await prefs.setString(key, value.toString());
    }
  }

  @override
  Future<void> initStorage() async {
    prefs = await SharedPreferences.getInstance();
    print("amsdev inicio bien el preferences");
  }



}

