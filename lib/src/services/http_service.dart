import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

abstract class IHttpService {
  dynamic get(String url);
}

class HttpService implements IHttpService {
  final Client client;
  HttpService({required this.client});

  @override
  dynamic get(String url) async {
    try {
      final networkResponse = await client.get(Uri.parse(url));
      final decodedResponse = jsonDecode(networkResponse.body);
      return decodedResponse['data'];
    } on SocketException catch (socketErr) {
      throw SocketException(socketErr.toString());
    } on HttpException catch (httpErr) {
      throw HttpException(httpErr.toString());
    } on FormatException catch (formatErr) {
      throw FormatException(formatErr.toString());
    } catch (e) {
      throw 'An error occured, kindly check back';
    }
  }
}
