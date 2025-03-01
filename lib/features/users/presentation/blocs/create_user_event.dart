import 'package:equatable/equatable.dart';

abstract class CreateUserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateUserRequested extends CreateUserEvent {
  final String firstName;
  final String lastName;
  final String email;

  CreateUserRequested({required this.firstName, required this.lastName, required this.email});

  @override
  List<Object?> get props => [firstName, lastName, email];
}
