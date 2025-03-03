import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reqresz/core/error/failure.dart';
import 'package:reqresz/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:reqresz/features/auth/domain/usecases/login_usecase.dart';
import 'package:reqresz/features/auth/domain/usecases/logout_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final AuthLocalDataSource localDataSource;

  LoginBloc(this.loginUseCase, this.logoutUseCase, this.localDataSource) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<CheckUserSession>(_onCheckUserSession);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    final result = await loginUseCase.call(LoginParams(
      email: event.email,
      password: event.password,
    ));

    await result.fold((failure) async{
      String errorMessage = _mapFailureToMessage(failure);
      debugPrint("Login Failed: $errorMessage"); // Debug log
      emit(LoginFailure(errorMessage));
    }, (token) async {
      debugPrint("Login Success: $token"); // Debug log
      await localDataSource.saveToken(token);
      emit(LoginSuccess(token));
    });
  }

  Future<void> _onCheckUserSession(
      CheckUserSession event, Emitter<LoginState> emit) async {
    final token = await localDataSource.getToken();
    if (token != null) {
      emit(LoginSuccess(token));
    } else {
      emit(LoginInitial());
    }
  }

  Future<void> _onLogoutRequested(
      LogoutRequested event, Emitter<LoginState> emit) async {
    await localDataSource.clearSession();
    emit(LoginInitial());
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
