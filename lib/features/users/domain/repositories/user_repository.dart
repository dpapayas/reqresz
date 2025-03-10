import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUsers();
  Future<Either<Failure, User>> createUser(String firstName, String lastName, String email);
  Future<Either<Failure, User>> updateUser(String id, String firstName, String lastName, String email);
  Future<Either<Failure, void>> deleteUser(String userId);
}
