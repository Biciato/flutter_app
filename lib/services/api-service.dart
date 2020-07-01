import 'dart:convert';
import 'dart:io';
import 'package:aldeia_montessori/services/storage-service.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import './auth-service.dart';

/// A service for api requests managment.
class ApiService {
  factory ApiService() {
    return _instance;
  }

  ApiService._internal();

  static final ApiService _instance = ApiService._internal();
  static const String missingInternetConnectionMessage = 'Sem conexão com a Internet';

  AuthService get apiService => AuthService();
  StorageService get storageService => StorageService();

  final String _baseUrl = 'https://sige.aigen.com.br/';
  final AuthService authService = AuthService();

  Future<Map<String, String>> getHeaders() async => <String, String>{
    HttpHeaders.authorizationHeader: 'Bearer ${storageService.getToken()}',
    HttpHeaders.contentTypeHeader: 'application/json'
  };

  Future<dynamic> get(String url) async {
    dynamic responseJson;
    try {
      final http.Response response = await http.get(_baseUrl + url, headers: await getHeaders());
      responseJson = _returnResponse(response.statusCode, response.body.toString());
    } on SocketException {
      throw FetchDataException(missingInternetConnectionMessage);
    }
    return responseJson;
  }

  Future<dynamic> post({ @required String url, @required Map<String, dynamic> data}) async {
    dynamic responseJson;
    try {
      final http.Response response = await http.post(_baseUrl + url, body: jsonEncode(data), headers: await getHeaders());
      responseJson = _returnResponse(response.statusCode, response.body.toString());
    } on SocketException {
      throw FetchDataException(missingInternetConnectionMessage);
    }
    return responseJson;
  }

  dynamic _returnResponse(int statusCode, String jsonString) {
    final dynamic responseJson = json.decode(jsonString);
    switch (statusCode) {
      case 200:
        return responseJson;
      case 400:
        throw BadRequestException(responseJson['message'] as String);
      case 401:
      case 403:
        throw UnauthorisedException(responseJson['message'] as String);
      case 500:
      default:
        throw FetchDataException(responseJson['message'] as String);
    }
  }
}

abstract class CustomException {
  CustomException(this.message);

  final String message;
}

class BadRequestException extends CustomException {
  BadRequestException(String message) : super(message);
}

class UnauthorisedException extends CustomException {
  UnauthorisedException(String message) : super(message);
}

class FetchDataException extends CustomException {
  FetchDataException(String message) : super(message);
}