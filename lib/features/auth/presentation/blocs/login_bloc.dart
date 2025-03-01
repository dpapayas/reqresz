import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reqresz/features/auth/domain/usecases/login_usecase.dart';
import 'package:reqresz/core/error/failure.dart';

class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;
  LoginSuccess(this.token);
}

class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
}

class LoginBloc extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial());

  void login(String email, String password) async {
    emit(LoginLoading());
    final result = await loginUseCase.doLogin(email, password);

    result.fold(
          (failure) {
        String errorMessage = _mapFailureToMessage(failure);
        Fluttertoast.showToast(msg: errorMessage);
        emit(LoginError(errorMessage));
      },
          (token) {
        emit(LoginSuccess(token));
      },
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
