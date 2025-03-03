import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reqresz/core/usecases/usecase.dart';
import 'package:reqresz/features/users/domain/entities/user.dart';
import 'package:reqresz/features/users/domain/usecases/get_users_usecase.dart';
import 'package:reqresz/features/users/domain/usecases/update_user_usecase.dart';
import 'package:reqresz/features/users/domain/usecases/delete_user_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUseCase getUsersUseCase;
  final UpdateUserUseCase updateUserUseCase;
  final DeleteUserUseCase deleteUserUseCase;

  UserBloc({
    required this.getUsersUseCase,
    required this.updateUserUseCase,
    required this.deleteUserUseCase,
  }) : super(UserInitial()) {

    // Load Users
    on<LoadUsers>((event, emit) async {
      emit(UserLoading());
      final result = await getUsersUseCase(NoParams());
      result.fold(
            (failure) => emit(UserError(failure.message)),
            (users) => emit(UserLoaded(users)),
      );
    });

    // Update User
    on<UpdateUser>((event, emit) async {
      if (state is UserLoaded) {
        final currentState = state as UserLoaded;
        try {
          emit(UserLoading());

          final result = await updateUserUseCase(UpdateUserParams(
            id: event.userId,
            firstName: event.firstName,
            lastName: event.lastName,
            email: event.email,
          ));

          result.fold(
                (failure) => emit(UserError(failure.message)),
                (updatedUser) {
              final updatedUsers = currentState.users.map((user) {
                return user.id == event.userId ? updatedUser : user;
              }).toList();

              emit(UserLoaded(updatedUsers));
            },
          );
        } catch (e) {
          emit(UserError("Failed to update user"));
        }
      }
    });

    // Delete User
    on<DeleteUser>((event, emit) async {
      if (state is UserLoaded) {
        final currentState = state as UserLoaded;
        try {
          emit(UserLoading());

          final result = await deleteUserUseCase(event.id);

          result.fold(
                (failure) => emit(UserError(failure.message)),
                (_) {
              final updatedUsers =
              currentState.users.where((user) => user.id != event.id).toList();

              emit(UserLoaded(updatedUsers));
            },
          );
        } catch (e) {
          emit(UserError("Failed to delete user"));
        }
      }
    });
  }
}
