import 'package:get_storage/get_storage.dart';

abstract class IStorageService {
  Future<void> save({required String key, required dynamic value});

  T? read<T>({required String key});

  Future<void> delete({required String key});
}

// final storageProvider = Provider(
//   (ref) => LocalStorage(storage: GetStorage()),
// );

class LocalStorage implements IStorageService {
  GetStorage storage;
  LocalStorage({required this.storage});
  // LocalStorage({required IStorageService storage}) : _storage=storage;

  // final IStorageService _storage;

  @override
  Future<void> delete({required String key}) async {
    await storage.remove(key);
  }

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
