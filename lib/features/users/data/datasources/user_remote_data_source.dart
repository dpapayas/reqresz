import 'package:reqresz/core/network/api_client.dart';
import 'package:reqresz/features/users/data/models/user_model.dart';
import 'package:reqresz/features/users/domain/entities/user.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
  Future<UserModel> createUser(String firstName, String lastName, String email);
  Future<User> updateUser(String id, String firstName, String lastName);
  Future<void> deleteUser(String id);
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

  @override
  Future<UserModel> createUser(
      String firstName, String lastName, String email) async {
    final response = await apiClient.post(
      '/users',
      data: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
      },
    );

    return UserModel.fromJson(response.data);
  }

  @override
  Future<User> updateUser(String id, String firstName, String lastName) async {
    final response = await apiClient.put(
      '/users/$id',
      data: {
        "first_name": firstName,
        "last_name": lastName,
      },
    );

    return User(
      id: id,
      email: response.data['email'] ?? '',
      firstName: response.data['first_name'],
      lastName: response.data['last_name'],
      avatar: response.data['avatar'] ?? '',
    );
  }

  @override
  Future<void> deleteUser(String userId) async {
    final response = await apiClient.delete(
      '/users/$userId'
    );

    if (response.statusCode != 204) {
      throw ServerException(message: "Failed to delete user");
    }
  }
}
