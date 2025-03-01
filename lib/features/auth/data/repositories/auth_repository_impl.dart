import 'package:dartz/dartz.dart';
import 'package:reqresz/core/error/failure.dart';
import 'package:reqresz/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:reqresz/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> login(String email, String password) async {
    try {
      final user = await remoteDataSource.login(email, password);
      return Right(user.token);
    } catch (e) {
      return Left(ServerFailure(message: "Failed to login", statusCode: 500));
    }
  }
}
