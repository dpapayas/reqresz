import 'package:equatable/equatable.dart';
import 'package:reqresz/features/users/domain/entities/user.dart';

abstract class UpdateUserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateUserInitial extends UpdateUserState {}

class UpdateUserLoading extends UpdateUserState {}

class UpdateUserSuccess extends UpdateUserState {
  final User   updatedUser;

  UpdateUserSuccess({required this.updatedUser});

  @override
  List<Object?> get props => [updatedUser];
}

class UpdateUserFailure extends UpdateUserState {
  final String message;

  UpdateUserFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
