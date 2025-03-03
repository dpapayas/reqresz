part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  final String email;
  final String password;
  final bool isPasswordVisible;

  const LoginState({
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
  });

  @override
  List<Object?> get props => [email, password, isPasswordVisible];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading({super.email, super.password, super.isPasswordVisible});
}

class LoginSuccess extends LoginState {
  final String token;

  const LoginSuccess(this.token, {super.email, super.password, super.isPasswordVisible});

  @override
  List<Object> get props => [token, email, password, isPasswordVisible];
}

class LoginFailure extends LoginState {
  final String message;

  const LoginFailure(this.message, {super.email, super.password, super.isPasswordVisible});

  @override
  List<Object> get props => [message, email, password, isPasswordVisible];
}
