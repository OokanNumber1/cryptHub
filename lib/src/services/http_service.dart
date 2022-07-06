import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

abstract class IHttpService {
dynamic get(String url);
}

class HttpService implements IHttpService {

  @override
  dynamic get(String url) async {
    final networkResponse = await http.get(Uri.parse(url));
    final decodedResponse = jsonDecode(networkResponse.body);
    return decodedResponse['data'];
  }
}

final networkService = Provider<IHttpService>((ref){
  return HttpService();
});
