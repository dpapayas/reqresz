import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../domain/usecases/create_user_usecase.dart';
import 'create_user_event.dart';
import 'create_user_state.dart';

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  final CreateUserUseCase createUserUseCase;

  CreateUserBloc(this.createUserUseCase) : super(CreateUserInitial()) {
    on<CreateUserRequested>(_onCreateUserRequested);
  }

  Future<void> _onCreateUserRequested(
      CreateUserRequested event, Emitter<CreateUserState> emit) async {
    emit(CreateUserLoading());

    final result = await createUserUseCase.execute(event.firstName, event.lastName, event.email);

    result.fold(
          (failure) => emit(CreateUserFailure(failure.message)),
          (user) => emit(CreateUserSuccess(user)),
    );
  }
}
