import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reqresz/core/usecases/usecase.dart';
import 'package:reqresz/features/users/domain/entities/user.dart';
import 'package:reqresz/features/users/domain/usecases/get_users_usecase.dart';
import 'package:reqresz/features/users/domain/usecases/update_user_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUseCase getUsersUseCase;
  final UpdateUserUseCase updateUserUseCase;

  UserBloc({required this.getUsersUseCase, required this.updateUserUseCase}) : super(UserInitial()) {
    on<LoadUsers>((event, emit) async {
      emit(UserLoading());
      final result = await getUsersUseCase(NoParams());
      result.fold(
            (failure) => emit(UserError(failure.message)),
            (users) => emit(UserLoaded(users)),
      );
    });

    on<UpdateUser>((event, emit) async {
      if (state is UserLoaded) {
        final currentState = state as UserLoaded;

        emit(UserLoading());

        final result = await updateUserUseCase(UpdateUserParams(
          id: event.userId,
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
        ));

        result.fold(
              (failure) {
            emit(UserError(failure.message));
          },
              (updatedUser) {
            if (updatedUser == null) {
              emit(UserError("Failed to update user, response is null"));
              return;
            }

            final updatedUsers = currentState.users.map((user) {
              return user.id == event.userId ? updatedUser : user;
            }).toList();

            emit(UserLoaded(updatedUsers));
          },
        );
      }
    });
  }
}
