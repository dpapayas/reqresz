import 'package:dartz/dartz.dart';
import 'package:reqresz/core/error/failure.dart';
import 'package:reqresz/core/network/network_info.dart';
import 'package:reqresz/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:reqresz/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:reqresz/features/auth/domain/entities/user.dart';
import 'package:reqresz/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
      this.remoteDataSource, this.networkInfo, this.localDataSource);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.login(email, password);
        await localDataSource.saveToken(user.token);

        return Right(user);
      } catch (e) {
        return Left(ServerFailure(message: "Login failed"));
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, User>> register(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.register(email, password);
        await localDataSource.saveToken(user.token);

        return Right(user);
      } catch (e) {
        return Left(ServerFailure(message: "Registration failed"));
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await localDataSource.clearSession();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: "Failed to logout"));
    }
  }
}
