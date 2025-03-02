import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reqresz/core/error/failure.dart';
import 'package:reqresz/features/auth/domain/usecases/login_usecase.dart';
import 'package:reqresz/features/auth/domain/usecases/logout_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;

  LoginBloc(this.loginUseCase, this.logoutUseCase) : super(LoginInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLoginRequested(
      LoginRequested event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    final result = await loginUseCase.call(LoginParams(
      email: event.email,
      password: event.password,
    ));

    result.fold((failure) {
      String errorMessage = _mapFailureToMessage(failure);
      Fluttertoast.showToast(msg: errorMessage);
      emit(LoginFailure(errorMessage));
    }, (user) => emit(LoginSuccess(user.token)));
  }

  Future<void> _onLogoutRequested(
      LogoutRequested event, Emitter<LoginState> emit) async {
    final result = await logoutUseCase.call();

    result.fold((failure) {
      Fluttertoast.showToast(msg: "Logout Failed");
    }, (_) {
      emit(LoginInitial());
    });
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
