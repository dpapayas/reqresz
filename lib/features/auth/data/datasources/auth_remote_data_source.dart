import 'package:reqresz/core/network/api_client.dart';
import '../../domain/entities/user.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<User> login(String email, String password);
  Future<User> register(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl(this.apiClient);

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await apiClient.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      return UserModel.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<User> register(String email, String password) async {
    try {
      final response = await apiClient.post(
        '/register',
        data: {
          'email': email,
          'password': password,
        },
      );

      return UserModel.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }
}
