import 'package:equatable/equatable.dart';

abstract class DeleteUserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DeleteUserRequested extends DeleteUserEvent {
  final String userId;

  DeleteUserRequested({required this.userId});

  @override
  List<Object?> get props => [userId];
}
