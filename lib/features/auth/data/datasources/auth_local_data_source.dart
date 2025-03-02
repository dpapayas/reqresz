import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> clearSession();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> saveToken(String token) async {
    await sharedPreferences.setString("token", token);
  }

  @override
  Future<String?> getToken() async {
    return sharedPreferences.getString("token");
  }

  @override
  Future<void> clearSession() async {
    await sharedPreferences.remove("token");
  }
}
