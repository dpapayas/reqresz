import 'package:equatable/equatable.dart';
import '../../domain/entities/user.dart';

abstract class CreateUserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateUserInitial extends CreateUserState {}

class CreateUserLoading extends CreateUserState {}

class CreateUserSuccess extends CreateUserState {
  final User user;
  CreateUserSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class CreateUserFailure extends CreateUserState {
  final String message;
  CreateUserFailure(this.message);

  @override
  List<Object?> get props => [message];
}
