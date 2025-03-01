import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reqresz/core/usecases/usecase.dart';
import 'package:reqresz/features/users/domain/entities/user.dart';
import 'package:reqresz/features/users/domain/usecases/get_users_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUseCase getUsersUseCase;

  UserBloc(this.getUsersUseCase) : super(UserInitial()) {
    on<LoadUsers>((event, emit) async {
      emit(UserLoading());
      final result = await getUsersUseCase(NoParams());
      result.fold(
            (failure) => emit(UserError(failure.message)),
            (users) => emit(UserLoaded(users)),
      );
    });
  }
}
