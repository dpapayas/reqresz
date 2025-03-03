import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reqresz/features/users/domain/entities/user.dart';
import 'package:reqresz/features/users/domain/usecases/update_user_usecase.dart';

part 'update_user_event.dart';
part 'update_user_state.dart';

class UpdateUserBloc extends Bloc<UpdateUserEvent, UpdateUserState> {
  final UpdateUserUseCase updateUserUseCase;

  UpdateUserBloc(this.updateUserUseCase) : super(UpdateUserInitial()) {
    on<UpdateUserRequested>((event, emit) async {
      emit(UpdateUserLoading());
      final result = await updateUserUseCase(UpdateUserParams(
        id: event.id,
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
      ));

      result.fold(
            (failure) => emit(UpdateUserError(failure.message)),
            (updatedUser) => emit(UpdateUserSuccess(updatedUser)),
      );
    });
  }
}
