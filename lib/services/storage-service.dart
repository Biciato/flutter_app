import 'package:aldeia_montessori/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// A service for storage.
///
///
class StorageService {
  factory StorageService() {
    return _instance;
  }

  StorageService._internal();

  static final StorageService _instance = StorageService._internal();

  FlutterSecureStorage get storage => const FlutterSecureStorage();

  /// Gets Token from Storage.
  Future<String> getToken() async => await storage.read(key: 'token');

  /// Saves User data on the storage.
  Future<void> saveUserData(User user) async {
    await storage.write(key: 'id', value: user.id);
    await storage.write(key: 'token', value: user.token);
    await storage.write(key: 'role', value: user.role);
    await storage.write(key: 'name', value: user.name);
  }

  /// Deletes User Data from the storage  .
  Future<void> deleteUserData() async {
    await storage.delete(key: 'id');
    await storage.delete(key: 'token');
    await storage.delete(key: 'role');
  }

  Future<void> saveAvatar(String path) async {
    await storage.write(key: 'avatar_path', value: path);
  }

  Future<String> getAvatarPath() async => await storage.read(key: 'avatar_path');

  Future<bool> hasSkipIntroduction() async => await storage.read(key: 'skip_introduction') != null;

  Future<String> getUsername() async => await storage.read(key: 'name');
}