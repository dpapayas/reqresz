import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:reqresz/features/users/domain/usecases/delete_user_usecase.dart';
import 'delete_user_event.dart';
import 'delete_user_state.dart';
import 'package:reqresz/core/error/failure.dart';

class DeleteUserBloc extends Bloc<DeleteUserEvent, DeleteUserState> {
  final DeleteUserUseCase deleteUserUseCase;

  DeleteUserBloc({required this.deleteUserUseCase}) : super(DeleteUserInitial()) {
    on<DeleteUserRequested>(_onDeleteUserRequested);
  }

  Future<void> _onDeleteUserRequested(
      DeleteUserRequested event, Emitter<DeleteUserState> emit) async {
    emit(DeleteUserLoading());

    final result = await deleteUserUseCase.execute(event.userId);

    result.fold(
          (failure) => emit(DeleteUserFailure(message: _mapFailureToMessage(failure))),
          (_) => emit(DeleteUserSuccess()),
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
