import 'package:dartz/dartz.dart';
import 'package:reqresz/core/error/failure.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class CreateUserUseCase {
  final UserRepository repository;

  CreateUserUseCase(this.repository);

  Future<Either<Failure, User>> execute(String firstName, String lastName, String email) {
    return repository.createUser(firstName, lastName, email);
  }
}
