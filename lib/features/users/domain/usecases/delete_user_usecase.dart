import 'package:dartz/dartz.dart';
import 'package:reqresz/core/error/failure.dart';
import 'package:reqresz/core/usecases/usecase.dart';
import 'package:reqresz/features/users/domain/repositories/user_repository.dart';

class DeleteUserUseCase implements UseCase<void, String> {
  final UserRepository repository;

  DeleteUserUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String userId) async {
    return await repository.deleteUser(userId);
  }
}
