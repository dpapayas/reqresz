import 'package:dartz/dartz.dart';
import 'package:reqresz/core/error/failure.dart';
import 'package:reqresz/core/usecases/usecase.dart';
import 'package:reqresz/features/users/domain/entities/user.dart';
import 'package:reqresz/features/users/domain/repositories/user_repository.dart';

class UpdateUserUseCase implements UseCase<User, UpdateUserParams> {
  final UserRepository repository;

  UpdateUserUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(UpdateUserParams params) async {
    return await repository.updateUser(params.id, params.firstName, params.lastName, params.email);
  }
}

class UpdateUserParams {
  final String id;
  final String firstName;
  final String lastName;
  final String email;

  UpdateUserParams({required this.id, required this.firstName, required this.lastName, required this.email});
}
