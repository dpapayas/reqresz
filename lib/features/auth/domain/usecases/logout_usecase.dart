import 'package:dartz/dartz.dart';
import 'package:reqresz/core/error/failure.dart';
import 'package:reqresz/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  Future<Either<Failure, void>> call() async {
    return await repository.logout();
  }
}
