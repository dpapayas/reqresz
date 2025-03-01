import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reqresz/core/error/failure.dart';
import 'package:reqresz/features/auth/domain/usecases/register_usecase.dart';
import 'package:reqresz/features/auth/presentation/blocs/register_event.dart';
import 'package:reqresz/features/auth/presentation/blocs/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterBloc(this.registerUseCase) : super(RegisterInitial()) {
    on<RegisterRequested>(_onRegisterRequested);
  }

  Future<void> _onRegisterRequested(
      RegisterRequested event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());

    final result = await registerUseCase.call(RegisterParams(
      email: event.email,
      password: event.password,
    ));

    result.fold(
          (failure) {
            String errorMessage = _mapFailureToMessage(failure);
            Fluttertoast.showToast(msg: errorMessage);
            emit(RegisterFailure(errorMessage));
          },
          (user) => emit(RegisterSuccess(user.token)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return "Server error: ${failure.message}";
    } else if (failure is NetworkFailure) {
      return "No Internet Connection";
    } else if (failure is AuthenticationFailure) {
      return "Invalid Credentials";
    } else {
      return "Unexpected Error";
    }
  }
}
