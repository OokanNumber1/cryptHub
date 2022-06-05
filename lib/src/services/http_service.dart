import 'dart:convert';
import 'package:crypto_suggest/src/services/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

abstract class NetworkAbstract {
dynamic get(String url);
}

class HttpService implements NetworkAbstract {

  @override
  dynamic get(String url) async {
    final localStorage = LocalStorage(storage: GetStorage());
    final networkResponse = await http.get(Uri.parse(url));
    final decodedResponse = jsonDecode(networkResponse.body);

    await localStorage.save(key: 'tokens', value: decodedResponse);
    return decodedResponse['data'];
  }
}

final networkService = Provider<NetworkAbstract>((ref){
  return HttpService();
});
