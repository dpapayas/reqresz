import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reqresz/core/error/failure.dart';
import 'package:reqresz/features/auth/domain/usecases/register_usecase.dart';

class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String token;
  RegisterSuccess(this.token);
}

class RegisterError extends RegisterState {
  final String message;
  RegisterError(this.message);
}

class RegisterBloc extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterBloc(this.registerUseCase) : super(RegisterInitial());

  void register(String email, String password) async {
    emit(RegisterLoading());
    final result = await registerUseCase(RegisterParams(email: email, password: password));

    result.fold(
          (failure) {
            String errorMessage = _mapFailureToMessage(failure);
            Fluttertoast.showToast(msg: errorMessage);
            emit(RegisterError(errorMessage));
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
