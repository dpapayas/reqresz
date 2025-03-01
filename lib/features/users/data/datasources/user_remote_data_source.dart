import 'package:reqresz/core/network/api_client.dart';
import 'package:reqresz/features/users/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiClient apiClient;

  UserRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await apiClient.get('/users');
      final List<dynamic> usersJson = response.data['data'];
      return usersJson.map((json) => UserModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch users');
    }
  }
}
