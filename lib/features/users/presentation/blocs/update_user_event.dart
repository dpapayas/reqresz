part of 'update_user_bloc.dart';

abstract class UpdateUserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateUserRequested extends UpdateUserEvent {
  final String id;
  final String firstName;
  final String lastName;
  final String email;

  UpdateUserRequested({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  @override
  List<Object?> get props => [id, firstName, lastName, email];
}
