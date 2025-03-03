part of 'update_user_bloc.dart';

abstract class UpdateUserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateUserInitial extends UpdateUserState {}

class UpdateUserLoading extends UpdateUserState {}

class UpdateUserSuccess extends UpdateUserState {
  final User updatedUser;

  UpdateUserSuccess(this.updatedUser);

  @override
  List<Object?> get props => [updatedUser];
}

class UpdateUserError extends UpdateUserState {
  final String message;

  UpdateUserError(this.message);

  @override
  List<Object?> get props => [message];
}
