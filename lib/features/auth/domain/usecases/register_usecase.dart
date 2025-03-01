import 'package:dartz/dartz.dart';
import 'package:reqresz/core/error/failure.dart';
import 'package:reqresz/core/usecases/usecase.dart';
import 'package:reqresz/features/auth/domain/entities/user.dart';
import 'package:reqresz/features/auth/domain/repositories/auth_repository.dart';


class RegisterUseCase implements UseCase<User, RegisterParams> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(RegisterParams params) {
    return repository.register(params.email, params.password);
  }
}

class RegisterParams {
  final String email;
  final String password;

  RegisterParams({required this.email, required this.password});
}
