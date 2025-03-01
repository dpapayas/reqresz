import 'package:dartz/dartz.dart';
import 'package:reqresz/core/error/failure.dart';
import 'package:reqresz/core/usecases/usecase.dart';
import 'package:reqresz/features/users/domain/entities/user.dart';
import 'package:reqresz/features/users/domain/repositories/user_repository.dart';

class GetUsersUseCase implements UseCase<List<User>, NoParams> {
  final UserRepository repository;

  GetUsersUseCase(this.repository);

  @override
  Future<Either<Failure, List<User>>> call(NoParams params) {
    return repository.getUsers();
  }
}
