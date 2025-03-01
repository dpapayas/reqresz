import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reqresz/core/error/failure.dart';
import 'package:reqresz/features/users/domain/usecases/update_user_usecase.dart';
import 'update_user_event.dart';
import 'update_user_state.dart';

class UpdateUserBloc extends Bloc<UpdateUserEvent, UpdateUserState> {
  final UpdateUserUseCase updateUserUseCase;

  UpdateUserBloc({required this.updateUserUseCase})
      : super(UpdateUserInitial()) {
    on<UpdateUserRequested>(_onUpdateUserRequested);
  }

  Future<void> _onUpdateUserRequested(
      UpdateUserRequested event, Emitter<UpdateUserState> emit) async {
    emit(UpdateUserLoading());

    final result = await updateUserUseCase.call(
      event.id,
      event.firstName,
      event.lastName,
      event.email,
    );

    result.fold(
          (failure) => emit(UpdateUserFailure(message: _mapFailureToMessage(failure))),
          (user) => emit(UpdateUserSuccess(updatedUser: user)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return "Server error occurred.";
    } else if (failure is NetworkFailure) {
      return "Please check your internet connection.";
    } else {
      return "An unexpected error occurred.";
    }
  }
}
