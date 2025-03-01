import 'package:equatable/equatable.dart';

abstract class DeleteUserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DeleteUserInitial extends DeleteUserState {}

class DeleteUserLoading extends DeleteUserState {}

class DeleteUserSuccess extends DeleteUserState {}

class DeleteUserFailure extends DeleteUserState {
  final String message;
  DeleteUserFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
