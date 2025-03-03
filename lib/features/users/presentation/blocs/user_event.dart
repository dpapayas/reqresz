part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadUsers extends UserEvent {}

class UpdateUser extends UserEvent {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;

  UpdateUser({required this.userId, required this.firstName, required this.lastName, required this.email});

  @override
  List<Object> get props => [userId, firstName, email];
}

class DeleteUser extends UserEvent {
  final String id;

  DeleteUser({required this.id});

  @override
  List<Object> get props => [id];
}
