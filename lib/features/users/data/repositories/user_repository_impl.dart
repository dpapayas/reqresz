import 'package:dartz/dartz.dart';
import 'package:reqresz/core/error/failure.dart';
import 'package:reqresz/core/network/network_info.dart';
import 'package:reqresz/features/users/data/datasources/user_remote_data_source.dart';
import 'package:reqresz/features/users/domain/entities/user.dart';
import 'package:reqresz/features/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    if (await networkInfo.isConnected) {
      try {
        final users = await remoteDataSource.getUsers();
        return Right(users);
      } catch (e) {
        return Left(ServerFailure(message: 'Failed to fetch users'));
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, User>> createUser(
      String firstName, String lastName, String email) async {
    if (await networkInfo.isConnected) {
      try {
        final user =
            await remoteDataSource.createUser(firstName, lastName, email);
        return Right(user);
      } catch (e) {
        return Left(ServerFailure(message: "Failed to create user"));
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, User>> updateUser(String id, String firstName, String lastName, String email) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.updateUser(id, firstName, lastName);
        return Right(user);
      } catch (e) {
        return Left(ServerFailure(message: "Failed to update user"));
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser(String userId) async {
    try {
      await remoteDataSource.deleteUser(userId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: "Failed to delete user"));
    }
  }
}
