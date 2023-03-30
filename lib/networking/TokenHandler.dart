import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/storage_constants.dart';

// Create storage
AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

// Write value
saveJwtToken(token) async {
  await storage.write(key: StorageConstants.TOKEN, value: token);
}

// Read value
Future<String?> readJwtToken() async {
  final token=  await storage.read(key: StorageConstants.TOKEN);
  return token;
}

// Delete Token
deleteJwtToken(token) async {
   await storage.delete(key: StorageConstants.TOKEN);
}