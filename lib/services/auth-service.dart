import 'package:aldeia_montessori/models/user.dart';
import 'package:aldeia_montessori/services/storage-service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import './api-service.dart';

/// A service for authenticating users.
///
///
class AuthService {
  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  static final AuthService _instance = AuthService._internal();

  FlutterSecureStorage get storage => const FlutterSecureStorage();
  ApiService get apiService => ApiService();
  StorageService get storageService => StorageService();

  /// Authenticates User
  ///
  /// Sends the [username] and [password] credentials, then saves the
  /// Token into storage. It returns a boolean because the Login Page
  /// needs to confirm that the token was properly saved into storage.
  Future<User> authenticate({
    @required String email,
    @required String password,
  }) async {
    final dynamic response = await apiService.post(
        url: 'api/token',
        data: <String, String>{'username': email, 'password': password});
    final Map<String, dynamic> userJson = <String, dynamic>{
      'token': response['credentials']['token'],
      'id': response['credentials']['id'].toString(),
      'role': response['credentials']['role'],
      'name': response['credentials']['name']
    };
    final User user = User.fromJson(userJson);
    await storageService.saveUserData(user);
    return user;
  }

  Future<void> logout() async => storageService.deleteUserData();

  /// Checks if the User is authenticated, e.g, if the storage has a Token.
  Future<bool> isAuthenticated() async => await storageService.getToken() != null;
}
