import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IStorageService {
  Future<void> save({required String key, required dynamic value});

  T? read<T>({required String key});
}

class LocalStorage implements IStorageService {
  GetStorage storage;
  LocalStorage({required this.storage});

  @override
  T? read<T>({required String key}) {
    final data = storage.read(key);
    if (data != null) return data;
    return null;
  }

  @override
  Future<void> save({required String key, required value}) async {
    await storage.write(key, value);
  }
}

final localStorage = LocalStorage(storage: GetStorage());

// class LocalStoragePrefs{

//   T? read<T>({required String key}) async{
//     final  _prefs = await SharedPreferences.getInstance();
//    _prefs.getString(key);
//   }

//   Future<void> save({required String key, required value}) async{
//     final  _prefs = await SharedPreferences.getInstance();
//    await _prefs.setString(key, value);
//   }

// }

