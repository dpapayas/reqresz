import 'package:dartz/dartz.dart';
import 'package:reqresz/core/error/failure.dart';
import 'package:reqresz/features/users/domain/entities/user.dart';
import 'package:reqresz/features/users/domain/repositories/user_repository.dart';

class UpdateUserUseCase {
  final UserRepository repository;

  UpdateUserUseCase(this.repository);

  Future<Either<Failure, User>> call(
      String id, String firstName, String lastName, String email) {
    return repository.updateUser(id, firstName, lastName, email);
  }
}
